; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46212 () Bool)

(assert start!46212)

(declare-fun b!511670 () Bool)

(declare-fun e!298957 () Bool)

(declare-fun e!298956 () Bool)

(assert (=> b!511670 (= e!298957 e!298956)))

(declare-fun res!312335 () Bool)

(assert (=> b!511670 (=> (not res!312335) (not e!298956))))

(declare-datatypes ((SeekEntryResult!4277 0))(
  ( (MissingZero!4277 (index!19296 (_ BitVec 32))) (Found!4277 (index!19297 (_ BitVec 32))) (Intermediate!4277 (undefined!5089 Bool) (index!19298 (_ BitVec 32)) (x!48252 (_ BitVec 32))) (Undefined!4277) (MissingVacant!4277 (index!19299 (_ BitVec 32))) )
))
(declare-fun lt!234121 () SeekEntryResult!4277)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511670 (= res!312335 (or (= lt!234121 (MissingZero!4277 i!1204)) (= lt!234121 (MissingVacant!4277 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32866 0))(
  ( (array!32867 (arr!15810 (Array (_ BitVec 32) (_ BitVec 64))) (size!16174 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32866)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32866 (_ BitVec 32)) SeekEntryResult!4277)

(assert (=> b!511670 (= lt!234121 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511671 () Bool)

(declare-fun res!312333 () Bool)

(assert (=> b!511671 (=> (not res!312333) (not e!298957))))

(declare-fun arrayContainsKey!0 (array!32866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511671 (= res!312333 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312339 () Bool)

(assert (=> start!46212 (=> (not res!312339) (not e!298957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46212 (= res!312339 (validMask!0 mask!3524))))

(assert (=> start!46212 e!298957))

(assert (=> start!46212 true))

(declare-fun array_inv!11606 (array!32866) Bool)

(assert (=> start!46212 (array_inv!11606 a!3235)))

(declare-fun b!511672 () Bool)

(declare-fun res!312336 () Bool)

(assert (=> b!511672 (=> (not res!312336) (not e!298956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32866 (_ BitVec 32)) Bool)

(assert (=> b!511672 (= res!312336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511673 () Bool)

(declare-fun e!298959 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511673 (= e!298959 (or (bvsgt #b00000000000000000000000000000000 (size!16174 a!3235)) (bvsle j!176 (size!16174 a!3235))))))

(declare-fun lt!234123 () SeekEntryResult!4277)

(assert (=> b!511673 (= lt!234123 Undefined!4277)))

(declare-fun b!511674 () Bool)

(declare-fun res!312334 () Bool)

(assert (=> b!511674 (=> (not res!312334) (not e!298956))))

(declare-datatypes ((List!9968 0))(
  ( (Nil!9965) (Cons!9964 (h!10844 (_ BitVec 64)) (t!16196 List!9968)) )
))
(declare-fun arrayNoDuplicates!0 (array!32866 (_ BitVec 32) List!9968) Bool)

(assert (=> b!511674 (= res!312334 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9965))))

(declare-fun b!511675 () Bool)

(declare-fun res!312332 () Bool)

(assert (=> b!511675 (=> res!312332 e!298959)))

(declare-fun lt!234122 () SeekEntryResult!4277)

(assert (=> b!511675 (= res!312332 (or (not (is-Intermediate!4277 lt!234122)) (not (undefined!5089 lt!234122))))))

(declare-fun b!511676 () Bool)

(declare-fun res!312338 () Bool)

(assert (=> b!511676 (=> (not res!312338) (not e!298957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511676 (= res!312338 (validKeyInArray!0 k!2280))))

(declare-fun b!511677 () Bool)

(declare-fun res!312340 () Bool)

(assert (=> b!511677 (=> (not res!312340) (not e!298957))))

(assert (=> b!511677 (= res!312340 (validKeyInArray!0 (select (arr!15810 a!3235) j!176)))))

(declare-fun b!511678 () Bool)

(assert (=> b!511678 (= e!298956 (not e!298959))))

(declare-fun res!312337 () Bool)

(assert (=> b!511678 (=> res!312337 e!298959)))

(declare-fun lt!234120 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32866 (_ BitVec 32)) SeekEntryResult!4277)

(assert (=> b!511678 (= res!312337 (= lt!234122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234120 (select (store (arr!15810 a!3235) i!1204 k!2280) j!176) (array!32867 (store (arr!15810 a!3235) i!1204 k!2280) (size!16174 a!3235)) mask!3524)))))

(declare-fun lt!234119 () (_ BitVec 32))

(assert (=> b!511678 (= lt!234122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234119 (select (arr!15810 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511678 (= lt!234120 (toIndex!0 (select (store (arr!15810 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511678 (= lt!234119 (toIndex!0 (select (arr!15810 a!3235) j!176) mask!3524))))

(assert (=> b!511678 (= lt!234123 (Found!4277 j!176))))

(assert (=> b!511678 (= lt!234123 (seekEntryOrOpen!0 (select (arr!15810 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15812 0))(
  ( (Unit!15813) )
))
(declare-fun lt!234124 () Unit!15812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15812)

(assert (=> b!511678 (= lt!234124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511679 () Bool)

(declare-fun res!312341 () Bool)

(assert (=> b!511679 (=> (not res!312341) (not e!298957))))

(assert (=> b!511679 (= res!312341 (and (= (size!16174 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16174 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16174 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46212 res!312339) b!511679))

(assert (= (and b!511679 res!312341) b!511677))

(assert (= (and b!511677 res!312340) b!511676))

(assert (= (and b!511676 res!312338) b!511671))

(assert (= (and b!511671 res!312333) b!511670))

(assert (= (and b!511670 res!312335) b!511672))

(assert (= (and b!511672 res!312336) b!511674))

(assert (= (and b!511674 res!312334) b!511678))

(assert (= (and b!511678 (not res!312337)) b!511675))

(assert (= (and b!511675 (not res!312332)) b!511673))

(declare-fun m!493173 () Bool)

(assert (=> b!511674 m!493173))

(declare-fun m!493175 () Bool)

(assert (=> start!46212 m!493175))

(declare-fun m!493177 () Bool)

(assert (=> start!46212 m!493177))

(declare-fun m!493179 () Bool)

(assert (=> b!511670 m!493179))

(declare-fun m!493181 () Bool)

(assert (=> b!511672 m!493181))

(declare-fun m!493183 () Bool)

(assert (=> b!511677 m!493183))

(assert (=> b!511677 m!493183))

(declare-fun m!493185 () Bool)

(assert (=> b!511677 m!493185))

(declare-fun m!493187 () Bool)

(assert (=> b!511671 m!493187))

(declare-fun m!493189 () Bool)

(assert (=> b!511676 m!493189))

(declare-fun m!493191 () Bool)

(assert (=> b!511678 m!493191))

(declare-fun m!493193 () Bool)

(assert (=> b!511678 m!493193))

(declare-fun m!493195 () Bool)

(assert (=> b!511678 m!493195))

(assert (=> b!511678 m!493183))

(declare-fun m!493197 () Bool)

(assert (=> b!511678 m!493197))

(assert (=> b!511678 m!493183))

(assert (=> b!511678 m!493195))

(declare-fun m!493199 () Bool)

(assert (=> b!511678 m!493199))

(declare-fun m!493201 () Bool)

(assert (=> b!511678 m!493201))

(assert (=> b!511678 m!493183))

(declare-fun m!493203 () Bool)

(assert (=> b!511678 m!493203))

(assert (=> b!511678 m!493183))

(declare-fun m!493205 () Bool)

(assert (=> b!511678 m!493205))

(assert (=> b!511678 m!493195))

(declare-fun m!493207 () Bool)

(assert (=> b!511678 m!493207))

(push 1)

