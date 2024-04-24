; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45170 () Bool)

(assert start!45170)

(declare-fun b!495732 () Bool)

(declare-fun e!290790 () Bool)

(assert (=> b!495732 (= e!290790 true)))

(declare-datatypes ((SeekEntryResult!3835 0))(
  ( (MissingZero!3835 (index!17519 (_ BitVec 32))) (Found!3835 (index!17520 (_ BitVec 32))) (Intermediate!3835 (undefined!4647 Bool) (index!17521 (_ BitVec 32)) (x!46732 (_ BitVec 32))) (Undefined!3835) (MissingVacant!3835 (index!17522 (_ BitVec 32))) )
))
(declare-fun lt!224461 () SeekEntryResult!3835)

(declare-datatypes ((array!32059 0))(
  ( (array!32060 (arr!15412 (Array (_ BitVec 32) (_ BitVec 64))) (size!15776 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32059)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495732 (and (bvslt (x!46732 lt!224461) #b01111111111111111111111111111110) (or (= (select (arr!15412 a!3235) (index!17521 lt!224461)) (select (arr!15412 a!3235) j!176)) (= (select (arr!15412 a!3235) (index!17521 lt!224461)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15412 a!3235) (index!17521 lt!224461)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495733 () Bool)

(declare-fun res!298181 () Bool)

(assert (=> b!495733 (=> res!298181 e!290790)))

(get-info :version)

(assert (=> b!495733 (= res!298181 (or (undefined!4647 lt!224461) (not ((_ is Intermediate!3835) lt!224461))))))

(declare-fun b!495734 () Bool)

(declare-fun e!290793 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32059 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!495734 (= e!290793 (= (seekEntryOrOpen!0 (select (arr!15412 a!3235) j!176) a!3235 mask!3524) (Found!3835 j!176)))))

(declare-fun b!495735 () Bool)

(declare-fun res!298182 () Bool)

(declare-fun e!290791 () Bool)

(assert (=> b!495735 (=> (not res!298182) (not e!290791))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495735 (= res!298182 (and (= (size!15776 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15776 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15776 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495737 () Bool)

(declare-fun res!298180 () Bool)

(assert (=> b!495737 (=> (not res!298180) (not e!290791))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495737 (= res!298180 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495738 () Bool)

(declare-fun res!298178 () Bool)

(declare-fun e!290789 () Bool)

(assert (=> b!495738 (=> (not res!298178) (not e!290789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32059 (_ BitVec 32)) Bool)

(assert (=> b!495738 (= res!298178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495739 () Bool)

(declare-fun res!298173 () Bool)

(assert (=> b!495739 (=> (not res!298173) (not e!290791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495739 (= res!298173 (validKeyInArray!0 (select (arr!15412 a!3235) j!176)))))

(declare-fun b!495740 () Bool)

(assert (=> b!495740 (= e!290791 e!290789)))

(declare-fun res!298174 () Bool)

(assert (=> b!495740 (=> (not res!298174) (not e!290789))))

(declare-fun lt!224462 () SeekEntryResult!3835)

(assert (=> b!495740 (= res!298174 (or (= lt!224462 (MissingZero!3835 i!1204)) (= lt!224462 (MissingVacant!3835 i!1204))))))

(assert (=> b!495740 (= lt!224462 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495741 () Bool)

(declare-fun res!298177 () Bool)

(assert (=> b!495741 (=> (not res!298177) (not e!290789))))

(declare-datatypes ((List!9477 0))(
  ( (Nil!9474) (Cons!9473 (h!10344 (_ BitVec 64)) (t!15697 List!9477)) )
))
(declare-fun arrayNoDuplicates!0 (array!32059 (_ BitVec 32) List!9477) Bool)

(assert (=> b!495741 (= res!298177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9474))))

(declare-fun b!495742 () Bool)

(assert (=> b!495742 (= e!290789 (not e!290790))))

(declare-fun res!298176 () Bool)

(assert (=> b!495742 (=> res!298176 e!290790)))

(declare-fun lt!224463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32059 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!495742 (= res!298176 (= lt!224461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224463 (select (store (arr!15412 a!3235) i!1204 k0!2280) j!176) (array!32060 (store (arr!15412 a!3235) i!1204 k0!2280) (size!15776 a!3235)) mask!3524)))))

(declare-fun lt!224460 () (_ BitVec 32))

(assert (=> b!495742 (= lt!224461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224460 (select (arr!15412 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495742 (= lt!224463 (toIndex!0 (select (store (arr!15412 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495742 (= lt!224460 (toIndex!0 (select (arr!15412 a!3235) j!176) mask!3524))))

(assert (=> b!495742 e!290793))

(declare-fun res!298179 () Bool)

(assert (=> b!495742 (=> (not res!298179) (not e!290793))))

(assert (=> b!495742 (= res!298179 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14677 0))(
  ( (Unit!14678) )
))
(declare-fun lt!224464 () Unit!14677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14677)

(assert (=> b!495742 (= lt!224464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495736 () Bool)

(declare-fun res!298183 () Bool)

(assert (=> b!495736 (=> (not res!298183) (not e!290791))))

(assert (=> b!495736 (= res!298183 (validKeyInArray!0 k0!2280))))

(declare-fun res!298175 () Bool)

(assert (=> start!45170 (=> (not res!298175) (not e!290791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45170 (= res!298175 (validMask!0 mask!3524))))

(assert (=> start!45170 e!290791))

(assert (=> start!45170 true))

(declare-fun array_inv!11271 (array!32059) Bool)

(assert (=> start!45170 (array_inv!11271 a!3235)))

(assert (= (and start!45170 res!298175) b!495735))

(assert (= (and b!495735 res!298182) b!495739))

(assert (= (and b!495739 res!298173) b!495736))

(assert (= (and b!495736 res!298183) b!495737))

(assert (= (and b!495737 res!298180) b!495740))

(assert (= (and b!495740 res!298174) b!495738))

(assert (= (and b!495738 res!298178) b!495741))

(assert (= (and b!495741 res!298177) b!495742))

(assert (= (and b!495742 res!298179) b!495734))

(assert (= (and b!495742 (not res!298176)) b!495733))

(assert (= (and b!495733 (not res!298181)) b!495732))

(declare-fun m!477115 () Bool)

(assert (=> b!495736 m!477115))

(declare-fun m!477117 () Bool)

(assert (=> b!495740 m!477117))

(declare-fun m!477119 () Bool)

(assert (=> b!495738 m!477119))

(declare-fun m!477121 () Bool)

(assert (=> b!495741 m!477121))

(declare-fun m!477123 () Bool)

(assert (=> b!495734 m!477123))

(assert (=> b!495734 m!477123))

(declare-fun m!477125 () Bool)

(assert (=> b!495734 m!477125))

(declare-fun m!477127 () Bool)

(assert (=> start!45170 m!477127))

(declare-fun m!477129 () Bool)

(assert (=> start!45170 m!477129))

(declare-fun m!477131 () Bool)

(assert (=> b!495742 m!477131))

(declare-fun m!477133 () Bool)

(assert (=> b!495742 m!477133))

(declare-fun m!477135 () Bool)

(assert (=> b!495742 m!477135))

(assert (=> b!495742 m!477123))

(declare-fun m!477137 () Bool)

(assert (=> b!495742 m!477137))

(assert (=> b!495742 m!477123))

(declare-fun m!477139 () Bool)

(assert (=> b!495742 m!477139))

(declare-fun m!477141 () Bool)

(assert (=> b!495742 m!477141))

(assert (=> b!495742 m!477135))

(declare-fun m!477143 () Bool)

(assert (=> b!495742 m!477143))

(assert (=> b!495742 m!477123))

(assert (=> b!495742 m!477135))

(declare-fun m!477145 () Bool)

(assert (=> b!495742 m!477145))

(assert (=> b!495739 m!477123))

(assert (=> b!495739 m!477123))

(declare-fun m!477147 () Bool)

(assert (=> b!495739 m!477147))

(declare-fun m!477149 () Bool)

(assert (=> b!495732 m!477149))

(assert (=> b!495732 m!477123))

(declare-fun m!477151 () Bool)

(assert (=> b!495737 m!477151))

(check-sat (not b!495740) (not b!495734) (not start!45170) (not b!495739) (not b!495736) (not b!495738) (not b!495737) (not b!495741) (not b!495742))
(check-sat)
