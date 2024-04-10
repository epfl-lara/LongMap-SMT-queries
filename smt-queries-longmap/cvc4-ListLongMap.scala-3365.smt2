; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46246 () Bool)

(assert start!46246)

(declare-fun b!512180 () Bool)

(declare-fun res!312847 () Bool)

(declare-fun e!299160 () Bool)

(assert (=> b!512180 (=> res!312847 e!299160)))

(declare-datatypes ((SeekEntryResult!4294 0))(
  ( (MissingZero!4294 (index!19364 (_ BitVec 32))) (Found!4294 (index!19365 (_ BitVec 32))) (Intermediate!4294 (undefined!5106 Bool) (index!19366 (_ BitVec 32)) (x!48309 (_ BitVec 32))) (Undefined!4294) (MissingVacant!4294 (index!19367 (_ BitVec 32))) )
))
(declare-fun lt!234425 () SeekEntryResult!4294)

(assert (=> b!512180 (= res!312847 (or (not (is-Intermediate!4294 lt!234425)) (not (undefined!5106 lt!234425))))))

(declare-fun b!512181 () Bool)

(declare-fun e!299161 () Bool)

(declare-fun e!299163 () Bool)

(assert (=> b!512181 (= e!299161 e!299163)))

(declare-fun res!312843 () Bool)

(assert (=> b!512181 (=> (not res!312843) (not e!299163))))

(declare-fun lt!234429 () SeekEntryResult!4294)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512181 (= res!312843 (or (= lt!234429 (MissingZero!4294 i!1204)) (= lt!234429 (MissingVacant!4294 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32900 0))(
  ( (array!32901 (arr!15827 (Array (_ BitVec 32) (_ BitVec 64))) (size!16191 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32900)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32900 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!512181 (= lt!234429 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512182 () Bool)

(declare-fun res!312842 () Bool)

(assert (=> b!512182 (=> (not res!312842) (not e!299163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32900 (_ BitVec 32)) Bool)

(assert (=> b!512182 (= res!312842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512183 () Bool)

(declare-fun res!312844 () Bool)

(assert (=> b!512183 (=> (not res!312844) (not e!299161))))

(declare-fun arrayContainsKey!0 (array!32900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512183 (= res!312844 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512184 () Bool)

(declare-fun res!312848 () Bool)

(assert (=> b!512184 (=> (not res!312848) (not e!299161))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512184 (= res!312848 (validKeyInArray!0 (select (arr!15827 a!3235) j!176)))))

(declare-fun res!312851 () Bool)

(assert (=> start!46246 (=> (not res!312851) (not e!299161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46246 (= res!312851 (validMask!0 mask!3524))))

(assert (=> start!46246 e!299161))

(assert (=> start!46246 true))

(declare-fun array_inv!11623 (array!32900) Bool)

(assert (=> start!46246 (array_inv!11623 a!3235)))

(declare-fun b!512185 () Bool)

(declare-fun res!312846 () Bool)

(assert (=> b!512185 (=> (not res!312846) (not e!299161))))

(assert (=> b!512185 (= res!312846 (and (= (size!16191 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16191 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16191 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512186 () Bool)

(declare-fun res!312850 () Bool)

(assert (=> b!512186 (=> (not res!312850) (not e!299163))))

(declare-datatypes ((List!9985 0))(
  ( (Nil!9982) (Cons!9981 (h!10861 (_ BitVec 64)) (t!16213 List!9985)) )
))
(declare-fun arrayNoDuplicates!0 (array!32900 (_ BitVec 32) List!9985) Bool)

(assert (=> b!512186 (= res!312850 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9982))))

(declare-fun b!512187 () Bool)

(declare-fun res!312849 () Bool)

(assert (=> b!512187 (=> (not res!312849) (not e!299161))))

(assert (=> b!512187 (= res!312849 (validKeyInArray!0 k!2280))))

(declare-fun b!512188 () Bool)

(assert (=> b!512188 (= e!299163 (not e!299160))))

(declare-fun res!312845 () Bool)

(assert (=> b!512188 (=> res!312845 e!299160)))

(declare-fun lt!234430 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32900 (_ BitVec 32)) SeekEntryResult!4294)

(assert (=> b!512188 (= res!312845 (= lt!234425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234430 (select (store (arr!15827 a!3235) i!1204 k!2280) j!176) (array!32901 (store (arr!15827 a!3235) i!1204 k!2280) (size!16191 a!3235)) mask!3524)))))

(declare-fun lt!234426 () (_ BitVec 32))

(assert (=> b!512188 (= lt!234425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234426 (select (arr!15827 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512188 (= lt!234430 (toIndex!0 (select (store (arr!15827 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512188 (= lt!234426 (toIndex!0 (select (arr!15827 a!3235) j!176) mask!3524))))

(declare-fun lt!234428 () SeekEntryResult!4294)

(assert (=> b!512188 (= lt!234428 (Found!4294 j!176))))

(assert (=> b!512188 (= lt!234428 (seekEntryOrOpen!0 (select (arr!15827 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512188 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15846 0))(
  ( (Unit!15847) )
))
(declare-fun lt!234427 () Unit!15846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15846)

(assert (=> b!512188 (= lt!234427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512189 () Bool)

(assert (=> b!512189 (= e!299160 true)))

(assert (=> b!512189 (= lt!234428 Undefined!4294)))

(assert (= (and start!46246 res!312851) b!512185))

(assert (= (and b!512185 res!312846) b!512184))

(assert (= (and b!512184 res!312848) b!512187))

(assert (= (and b!512187 res!312849) b!512183))

(assert (= (and b!512183 res!312844) b!512181))

(assert (= (and b!512181 res!312843) b!512182))

(assert (= (and b!512182 res!312842) b!512186))

(assert (= (and b!512186 res!312850) b!512188))

(assert (= (and b!512188 (not res!312845)) b!512180))

(assert (= (and b!512180 (not res!312847)) b!512189))

(declare-fun m!493785 () Bool)

(assert (=> b!512183 m!493785))

(declare-fun m!493787 () Bool)

(assert (=> b!512184 m!493787))

(assert (=> b!512184 m!493787))

(declare-fun m!493789 () Bool)

(assert (=> b!512184 m!493789))

(declare-fun m!493791 () Bool)

(assert (=> b!512181 m!493791))

(declare-fun m!493793 () Bool)

(assert (=> b!512187 m!493793))

(declare-fun m!493795 () Bool)

(assert (=> start!46246 m!493795))

(declare-fun m!493797 () Bool)

(assert (=> start!46246 m!493797))

(declare-fun m!493799 () Bool)

(assert (=> b!512186 m!493799))

(assert (=> b!512188 m!493787))

(declare-fun m!493801 () Bool)

(assert (=> b!512188 m!493801))

(declare-fun m!493803 () Bool)

(assert (=> b!512188 m!493803))

(declare-fun m!493805 () Bool)

(assert (=> b!512188 m!493805))

(declare-fun m!493807 () Bool)

(assert (=> b!512188 m!493807))

(assert (=> b!512188 m!493787))

(declare-fun m!493809 () Bool)

(assert (=> b!512188 m!493809))

(assert (=> b!512188 m!493787))

(declare-fun m!493811 () Bool)

(assert (=> b!512188 m!493811))

(assert (=> b!512188 m!493787))

(declare-fun m!493813 () Bool)

(assert (=> b!512188 m!493813))

(assert (=> b!512188 m!493807))

(declare-fun m!493815 () Bool)

(assert (=> b!512188 m!493815))

(assert (=> b!512188 m!493807))

(declare-fun m!493817 () Bool)

(assert (=> b!512188 m!493817))

(declare-fun m!493819 () Bool)

(assert (=> b!512182 m!493819))

(push 1)

