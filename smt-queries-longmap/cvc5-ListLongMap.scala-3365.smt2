; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46242 () Bool)

(assert start!46242)

(declare-fun b!512120 () Bool)

(declare-fun res!312785 () Bool)

(declare-fun e!299139 () Bool)

(assert (=> b!512120 (=> (not res!312785) (not e!299139))))

(declare-datatypes ((array!32896 0))(
  ( (array!32897 (arr!15825 (Array (_ BitVec 32) (_ BitVec 64))) (size!16189 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32896)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512120 (= res!312785 (validKeyInArray!0 (select (arr!15825 a!3235) j!176)))))

(declare-fun b!512121 () Bool)

(declare-fun e!299138 () Bool)

(assert (=> b!512121 (= e!299138 true)))

(declare-datatypes ((SeekEntryResult!4292 0))(
  ( (MissingZero!4292 (index!19356 (_ BitVec 32))) (Found!4292 (index!19357 (_ BitVec 32))) (Intermediate!4292 (undefined!5104 Bool) (index!19358 (_ BitVec 32)) (x!48307 (_ BitVec 32))) (Undefined!4292) (MissingVacant!4292 (index!19359 (_ BitVec 32))) )
))
(declare-fun lt!234389 () SeekEntryResult!4292)

(assert (=> b!512121 (= lt!234389 Undefined!4292)))

(declare-fun b!512122 () Bool)

(declare-fun res!312791 () Bool)

(declare-fun e!299137 () Bool)

(assert (=> b!512122 (=> (not res!312791) (not e!299137))))

(declare-datatypes ((List!9983 0))(
  ( (Nil!9980) (Cons!9979 (h!10859 (_ BitVec 64)) (t!16211 List!9983)) )
))
(declare-fun arrayNoDuplicates!0 (array!32896 (_ BitVec 32) List!9983) Bool)

(assert (=> b!512122 (= res!312791 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9980))))

(declare-fun b!512123 () Bool)

(assert (=> b!512123 (= e!299139 e!299137)))

(declare-fun res!312790 () Bool)

(assert (=> b!512123 (=> (not res!312790) (not e!299137))))

(declare-fun lt!234391 () SeekEntryResult!4292)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512123 (= res!312790 (or (= lt!234391 (MissingZero!4292 i!1204)) (= lt!234391 (MissingVacant!4292 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32896 (_ BitVec 32)) SeekEntryResult!4292)

(assert (=> b!512123 (= lt!234391 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!312789 () Bool)

(assert (=> start!46242 (=> (not res!312789) (not e!299139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46242 (= res!312789 (validMask!0 mask!3524))))

(assert (=> start!46242 e!299139))

(assert (=> start!46242 true))

(declare-fun array_inv!11621 (array!32896) Bool)

(assert (=> start!46242 (array_inv!11621 a!3235)))

(declare-fun b!512124 () Bool)

(assert (=> b!512124 (= e!299137 (not e!299138))))

(declare-fun res!312788 () Bool)

(assert (=> b!512124 (=> res!312788 e!299138)))

(declare-fun lt!234393 () (_ BitVec 32))

(declare-fun lt!234392 () SeekEntryResult!4292)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32896 (_ BitVec 32)) SeekEntryResult!4292)

(assert (=> b!512124 (= res!312788 (= lt!234392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234393 (select (store (arr!15825 a!3235) i!1204 k!2280) j!176) (array!32897 (store (arr!15825 a!3235) i!1204 k!2280) (size!16189 a!3235)) mask!3524)))))

(declare-fun lt!234390 () (_ BitVec 32))

(assert (=> b!512124 (= lt!234392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234390 (select (arr!15825 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512124 (= lt!234393 (toIndex!0 (select (store (arr!15825 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512124 (= lt!234390 (toIndex!0 (select (arr!15825 a!3235) j!176) mask!3524))))

(assert (=> b!512124 (= lt!234389 (Found!4292 j!176))))

(assert (=> b!512124 (= lt!234389 (seekEntryOrOpen!0 (select (arr!15825 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32896 (_ BitVec 32)) Bool)

(assert (=> b!512124 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15842 0))(
  ( (Unit!15843) )
))
(declare-fun lt!234394 () Unit!15842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15842)

(assert (=> b!512124 (= lt!234394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512125 () Bool)

(declare-fun res!312786 () Bool)

(assert (=> b!512125 (=> (not res!312786) (not e!299139))))

(assert (=> b!512125 (= res!312786 (and (= (size!16189 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16189 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16189 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512126 () Bool)

(declare-fun res!312782 () Bool)

(assert (=> b!512126 (=> (not res!312782) (not e!299139))))

(declare-fun arrayContainsKey!0 (array!32896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512126 (= res!312782 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512127 () Bool)

(declare-fun res!312787 () Bool)

(assert (=> b!512127 (=> (not res!312787) (not e!299137))))

(assert (=> b!512127 (= res!312787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512128 () Bool)

(declare-fun res!312783 () Bool)

(assert (=> b!512128 (=> res!312783 e!299138)))

(assert (=> b!512128 (= res!312783 (or (not (is-Intermediate!4292 lt!234392)) (not (undefined!5104 lt!234392))))))

(declare-fun b!512129 () Bool)

(declare-fun res!312784 () Bool)

(assert (=> b!512129 (=> (not res!312784) (not e!299139))))

(assert (=> b!512129 (= res!312784 (validKeyInArray!0 k!2280))))

(assert (= (and start!46242 res!312789) b!512125))

(assert (= (and b!512125 res!312786) b!512120))

(assert (= (and b!512120 res!312785) b!512129))

(assert (= (and b!512129 res!312784) b!512126))

(assert (= (and b!512126 res!312782) b!512123))

(assert (= (and b!512123 res!312790) b!512127))

(assert (= (and b!512127 res!312787) b!512122))

(assert (= (and b!512122 res!312791) b!512124))

(assert (= (and b!512124 (not res!312788)) b!512128))

(assert (= (and b!512128 (not res!312783)) b!512121))

(declare-fun m!493713 () Bool)

(assert (=> start!46242 m!493713))

(declare-fun m!493715 () Bool)

(assert (=> start!46242 m!493715))

(declare-fun m!493717 () Bool)

(assert (=> b!512127 m!493717))

(declare-fun m!493719 () Bool)

(assert (=> b!512122 m!493719))

(declare-fun m!493721 () Bool)

(assert (=> b!512129 m!493721))

(declare-fun m!493723 () Bool)

(assert (=> b!512126 m!493723))

(declare-fun m!493725 () Bool)

(assert (=> b!512120 m!493725))

(assert (=> b!512120 m!493725))

(declare-fun m!493727 () Bool)

(assert (=> b!512120 m!493727))

(declare-fun m!493729 () Bool)

(assert (=> b!512124 m!493729))

(declare-fun m!493731 () Bool)

(assert (=> b!512124 m!493731))

(declare-fun m!493733 () Bool)

(assert (=> b!512124 m!493733))

(declare-fun m!493735 () Bool)

(assert (=> b!512124 m!493735))

(assert (=> b!512124 m!493729))

(assert (=> b!512124 m!493725))

(declare-fun m!493737 () Bool)

(assert (=> b!512124 m!493737))

(assert (=> b!512124 m!493725))

(declare-fun m!493739 () Bool)

(assert (=> b!512124 m!493739))

(assert (=> b!512124 m!493725))

(declare-fun m!493741 () Bool)

(assert (=> b!512124 m!493741))

(assert (=> b!512124 m!493725))

(declare-fun m!493743 () Bool)

(assert (=> b!512124 m!493743))

(assert (=> b!512124 m!493729))

(declare-fun m!493745 () Bool)

(assert (=> b!512124 m!493745))

(declare-fun m!493747 () Bool)

(assert (=> b!512123 m!493747))

(push 1)

