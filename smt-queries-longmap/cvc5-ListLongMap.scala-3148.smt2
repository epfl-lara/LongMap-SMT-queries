; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44310 () Bool)

(assert start!44310)

(declare-fun res!290678 () Bool)

(declare-fun e!286723 () Bool)

(assert (=> start!44310 (=> (not res!290678) (not e!286723))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44310 (= res!290678 (validMask!0 mask!3524))))

(assert (=> start!44310 e!286723))

(assert (=> start!44310 true))

(declare-datatypes ((array!31561 0))(
  ( (array!31562 (arr!15174 (Array (_ BitVec 32) (_ BitVec 64))) (size!15538 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31561)

(declare-fun array_inv!10970 (array!31561) Bool)

(assert (=> start!44310 (array_inv!10970 a!3235)))

(declare-fun b!487290 () Bool)

(declare-fun e!286725 () Bool)

(assert (=> b!487290 (= e!286725 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!286724 () Bool)

(assert (=> b!487290 e!286724))

(declare-fun res!290682 () Bool)

(assert (=> b!487290 (=> (not res!290682) (not e!286724))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31561 (_ BitVec 32)) Bool)

(assert (=> b!487290 (= res!290682 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14228 0))(
  ( (Unit!14229) )
))
(declare-fun lt!219988 () Unit!14228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14228)

(assert (=> b!487290 (= lt!219988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487291 () Bool)

(declare-fun res!290677 () Bool)

(assert (=> b!487291 (=> (not res!290677) (not e!286723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487291 (= res!290677 (validKeyInArray!0 (select (arr!15174 a!3235) j!176)))))

(declare-fun b!487292 () Bool)

(declare-fun res!290680 () Bool)

(assert (=> b!487292 (=> (not res!290680) (not e!286723))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487292 (= res!290680 (validKeyInArray!0 k!2280))))

(declare-fun b!487293 () Bool)

(declare-datatypes ((SeekEntryResult!3641 0))(
  ( (MissingZero!3641 (index!16743 (_ BitVec 32))) (Found!3641 (index!16744 (_ BitVec 32))) (Intermediate!3641 (undefined!4453 Bool) (index!16745 (_ BitVec 32)) (x!45869 (_ BitVec 32))) (Undefined!3641) (MissingVacant!3641 (index!16746 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31561 (_ BitVec 32)) SeekEntryResult!3641)

(assert (=> b!487293 (= e!286724 (= (seekEntryOrOpen!0 (select (arr!15174 a!3235) j!176) a!3235 mask!3524) (Found!3641 j!176)))))

(declare-fun b!487294 () Bool)

(assert (=> b!487294 (= e!286723 e!286725)))

(declare-fun res!290684 () Bool)

(assert (=> b!487294 (=> (not res!290684) (not e!286725))))

(declare-fun lt!219987 () SeekEntryResult!3641)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487294 (= res!290684 (or (= lt!219987 (MissingZero!3641 i!1204)) (= lt!219987 (MissingVacant!3641 i!1204))))))

(assert (=> b!487294 (= lt!219987 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487295 () Bool)

(declare-fun res!290681 () Bool)

(assert (=> b!487295 (=> (not res!290681) (not e!286723))))

(declare-fun arrayContainsKey!0 (array!31561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487295 (= res!290681 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487296 () Bool)

(declare-fun res!290683 () Bool)

(assert (=> b!487296 (=> (not res!290683) (not e!286725))))

(declare-datatypes ((List!9332 0))(
  ( (Nil!9329) (Cons!9328 (h!10184 (_ BitVec 64)) (t!15560 List!9332)) )
))
(declare-fun arrayNoDuplicates!0 (array!31561 (_ BitVec 32) List!9332) Bool)

(assert (=> b!487296 (= res!290683 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9329))))

(declare-fun b!487297 () Bool)

(declare-fun res!290679 () Bool)

(assert (=> b!487297 (=> (not res!290679) (not e!286723))))

(assert (=> b!487297 (= res!290679 (and (= (size!15538 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15538 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15538 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487298 () Bool)

(declare-fun res!290676 () Bool)

(assert (=> b!487298 (=> (not res!290676) (not e!286725))))

(assert (=> b!487298 (= res!290676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44310 res!290678) b!487297))

(assert (= (and b!487297 res!290679) b!487291))

(assert (= (and b!487291 res!290677) b!487292))

(assert (= (and b!487292 res!290680) b!487295))

(assert (= (and b!487295 res!290681) b!487294))

(assert (= (and b!487294 res!290684) b!487298))

(assert (= (and b!487298 res!290676) b!487296))

(assert (= (and b!487296 res!290683) b!487290))

(assert (= (and b!487290 res!290682) b!487293))

(declare-fun m!467121 () Bool)

(assert (=> b!487290 m!467121))

(declare-fun m!467123 () Bool)

(assert (=> b!487290 m!467123))

(declare-fun m!467125 () Bool)

(assert (=> b!487294 m!467125))

(declare-fun m!467127 () Bool)

(assert (=> b!487291 m!467127))

(assert (=> b!487291 m!467127))

(declare-fun m!467129 () Bool)

(assert (=> b!487291 m!467129))

(assert (=> b!487293 m!467127))

(assert (=> b!487293 m!467127))

(declare-fun m!467131 () Bool)

(assert (=> b!487293 m!467131))

(declare-fun m!467133 () Bool)

(assert (=> b!487295 m!467133))

(declare-fun m!467135 () Bool)

(assert (=> b!487292 m!467135))

(declare-fun m!467137 () Bool)

(assert (=> start!44310 m!467137))

(declare-fun m!467139 () Bool)

(assert (=> start!44310 m!467139))

(declare-fun m!467141 () Bool)

(assert (=> b!487298 m!467141))

(declare-fun m!467143 () Bool)

(assert (=> b!487296 m!467143))

(push 1)

(assert (not b!487294))

(assert (not b!487291))

(assert (not start!44310))

(assert (not b!487290))

(assert (not b!487293))

(assert (not b!487298))

(assert (not b!487292))

(assert (not b!487295))

(assert (not b!487296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

