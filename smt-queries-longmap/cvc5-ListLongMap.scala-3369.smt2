; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46266 () Bool)

(assert start!46266)

(declare-fun b!512480 () Bool)

(declare-fun e!299281 () Bool)

(declare-fun e!299282 () Bool)

(assert (=> b!512480 (= e!299281 (not e!299282))))

(declare-fun res!313143 () Bool)

(assert (=> b!512480 (=> res!313143 e!299282)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4304 0))(
  ( (MissingZero!4304 (index!19404 (_ BitVec 32))) (Found!4304 (index!19405 (_ BitVec 32))) (Intermediate!4304 (undefined!5116 Bool) (index!19406 (_ BitVec 32)) (x!48351 (_ BitVec 32))) (Undefined!4304) (MissingVacant!4304 (index!19407 (_ BitVec 32))) )
))
(declare-fun lt!234608 () SeekEntryResult!4304)

(declare-fun lt!234609 () (_ BitVec 32))

(declare-datatypes ((array!32920 0))(
  ( (array!32921 (arr!15837 (Array (_ BitVec 32) (_ BitVec 64))) (size!16201 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32920)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32920 (_ BitVec 32)) SeekEntryResult!4304)

(assert (=> b!512480 (= res!313143 (= lt!234608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234609 (select (store (arr!15837 a!3235) i!1204 k!2280) j!176) (array!32921 (store (arr!15837 a!3235) i!1204 k!2280) (size!16201 a!3235)) mask!3524)))))

(declare-fun lt!234606 () (_ BitVec 32))

(assert (=> b!512480 (= lt!234608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234606 (select (arr!15837 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512480 (= lt!234609 (toIndex!0 (select (store (arr!15837 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512480 (= lt!234606 (toIndex!0 (select (arr!15837 a!3235) j!176) mask!3524))))

(declare-fun lt!234607 () SeekEntryResult!4304)

(assert (=> b!512480 (= lt!234607 (Found!4304 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32920 (_ BitVec 32)) SeekEntryResult!4304)

(assert (=> b!512480 (= lt!234607 (seekEntryOrOpen!0 (select (arr!15837 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32920 (_ BitVec 32)) Bool)

(assert (=> b!512480 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15866 0))(
  ( (Unit!15867) )
))
(declare-fun lt!234610 () Unit!15866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15866)

(assert (=> b!512480 (= lt!234610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512481 () Bool)

(declare-fun res!313150 () Bool)

(declare-fun e!299283 () Bool)

(assert (=> b!512481 (=> (not res!313150) (not e!299283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512481 (= res!313150 (validKeyInArray!0 (select (arr!15837 a!3235) j!176)))))

(declare-fun b!512482 () Bool)

(declare-fun res!313151 () Bool)

(assert (=> b!512482 (=> res!313151 e!299282)))

(assert (=> b!512482 (= res!313151 (or (not (is-Intermediate!4304 lt!234608)) (not (undefined!5116 lt!234608))))))

(declare-fun b!512483 () Bool)

(declare-fun res!313146 () Bool)

(assert (=> b!512483 (=> (not res!313146) (not e!299283))))

(assert (=> b!512483 (= res!313146 (and (= (size!16201 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16201 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16201 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512484 () Bool)

(assert (=> b!512484 (= e!299282 true)))

(assert (=> b!512484 (= lt!234607 Undefined!4304)))

(declare-fun b!512485 () Bool)

(declare-fun res!313142 () Bool)

(assert (=> b!512485 (=> (not res!313142) (not e!299283))))

(assert (=> b!512485 (= res!313142 (validKeyInArray!0 k!2280))))

(declare-fun b!512486 () Bool)

(declare-fun res!313144 () Bool)

(assert (=> b!512486 (=> (not res!313144) (not e!299283))))

(declare-fun arrayContainsKey!0 (array!32920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512486 (= res!313144 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512488 () Bool)

(declare-fun res!313147 () Bool)

(assert (=> b!512488 (=> (not res!313147) (not e!299281))))

(declare-datatypes ((List!9995 0))(
  ( (Nil!9992) (Cons!9991 (h!10871 (_ BitVec 64)) (t!16223 List!9995)) )
))
(declare-fun arrayNoDuplicates!0 (array!32920 (_ BitVec 32) List!9995) Bool)

(assert (=> b!512488 (= res!313147 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9992))))

(declare-fun b!512489 () Bool)

(assert (=> b!512489 (= e!299283 e!299281)))

(declare-fun res!313145 () Bool)

(assert (=> b!512489 (=> (not res!313145) (not e!299281))))

(declare-fun lt!234605 () SeekEntryResult!4304)

(assert (=> b!512489 (= res!313145 (or (= lt!234605 (MissingZero!4304 i!1204)) (= lt!234605 (MissingVacant!4304 i!1204))))))

(assert (=> b!512489 (= lt!234605 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512487 () Bool)

(declare-fun res!313149 () Bool)

(assert (=> b!512487 (=> (not res!313149) (not e!299281))))

(assert (=> b!512487 (= res!313149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!313148 () Bool)

(assert (=> start!46266 (=> (not res!313148) (not e!299283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46266 (= res!313148 (validMask!0 mask!3524))))

(assert (=> start!46266 e!299283))

(assert (=> start!46266 true))

(declare-fun array_inv!11633 (array!32920) Bool)

(assert (=> start!46266 (array_inv!11633 a!3235)))

(assert (= (and start!46266 res!313148) b!512483))

(assert (= (and b!512483 res!313146) b!512481))

(assert (= (and b!512481 res!313150) b!512485))

(assert (= (and b!512485 res!313142) b!512486))

(assert (= (and b!512486 res!313144) b!512489))

(assert (= (and b!512489 res!313145) b!512487))

(assert (= (and b!512487 res!313149) b!512488))

(assert (= (and b!512488 res!313147) b!512480))

(assert (= (and b!512480 (not res!313143)) b!512482))

(assert (= (and b!512482 (not res!313151)) b!512484))

(declare-fun m!494145 () Bool)

(assert (=> start!46266 m!494145))

(declare-fun m!494147 () Bool)

(assert (=> start!46266 m!494147))

(declare-fun m!494149 () Bool)

(assert (=> b!512485 m!494149))

(declare-fun m!494151 () Bool)

(assert (=> b!512481 m!494151))

(assert (=> b!512481 m!494151))

(declare-fun m!494153 () Bool)

(assert (=> b!512481 m!494153))

(declare-fun m!494155 () Bool)

(assert (=> b!512487 m!494155))

(declare-fun m!494157 () Bool)

(assert (=> b!512488 m!494157))

(declare-fun m!494159 () Bool)

(assert (=> b!512486 m!494159))

(declare-fun m!494161 () Bool)

(assert (=> b!512480 m!494161))

(declare-fun m!494163 () Bool)

(assert (=> b!512480 m!494163))

(declare-fun m!494165 () Bool)

(assert (=> b!512480 m!494165))

(assert (=> b!512480 m!494165))

(declare-fun m!494167 () Bool)

(assert (=> b!512480 m!494167))

(assert (=> b!512480 m!494151))

(declare-fun m!494169 () Bool)

(assert (=> b!512480 m!494169))

(assert (=> b!512480 m!494151))

(declare-fun m!494171 () Bool)

(assert (=> b!512480 m!494171))

(assert (=> b!512480 m!494165))

(declare-fun m!494173 () Bool)

(assert (=> b!512480 m!494173))

(assert (=> b!512480 m!494151))

(declare-fun m!494175 () Bool)

(assert (=> b!512480 m!494175))

(assert (=> b!512480 m!494151))

(declare-fun m!494177 () Bool)

(assert (=> b!512480 m!494177))

(declare-fun m!494179 () Bool)

(assert (=> b!512489 m!494179))

(push 1)

