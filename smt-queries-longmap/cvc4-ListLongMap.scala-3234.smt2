; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45214 () Bool)

(assert start!45214)

(declare-fun b!496354 () Bool)

(declare-fun res!298745 () Bool)

(declare-fun e!291085 () Bool)

(assert (=> b!496354 (=> res!298745 e!291085)))

(declare-datatypes ((SeekEntryResult!3901 0))(
  ( (MissingZero!3901 (index!17783 (_ BitVec 32))) (Found!3901 (index!17784 (_ BitVec 32))) (Intermediate!3901 (undefined!4713 Bool) (index!17785 (_ BitVec 32)) (x!46841 (_ BitVec 32))) (Undefined!3901) (MissingVacant!3901 (index!17786 (_ BitVec 32))) )
))
(declare-fun lt!224706 () SeekEntryResult!3901)

(assert (=> b!496354 (= res!298745 (or (undefined!4713 lt!224706) (not (is-Intermediate!3901 lt!224706))))))

(declare-fun b!496355 () Bool)

(declare-fun res!298750 () Bool)

(declare-fun e!291083 () Bool)

(assert (=> b!496355 (=> (not res!298750) (not e!291083))))

(declare-datatypes ((array!32102 0))(
  ( (array!32103 (arr!15434 (Array (_ BitVec 32) (_ BitVec 64))) (size!15798 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32102)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496355 (= res!298750 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496356 () Bool)

(declare-fun res!298751 () Bool)

(assert (=> b!496356 (=> (not res!298751) (not e!291083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496356 (= res!298751 (validKeyInArray!0 k!2280))))

(declare-fun b!496357 () Bool)

(assert (=> b!496357 (= e!291085 true)))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496357 (and (bvslt (x!46841 lt!224706) #b01111111111111111111111111111110) (or (= (select (arr!15434 a!3235) (index!17785 lt!224706)) (select (arr!15434 a!3235) j!176)) (= (select (arr!15434 a!3235) (index!17785 lt!224706)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15434 a!3235) (index!17785 lt!224706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496358 () Bool)

(declare-fun e!291087 () Bool)

(assert (=> b!496358 (= e!291087 (not e!291085))))

(declare-fun res!298744 () Bool)

(assert (=> b!496358 (=> res!298744 e!291085)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224704 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32102 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!496358 (= res!298744 (= lt!224706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224704 (select (store (arr!15434 a!3235) i!1204 k!2280) j!176) (array!32103 (store (arr!15434 a!3235) i!1204 k!2280) (size!15798 a!3235)) mask!3524)))))

(declare-fun lt!224707 () (_ BitVec 32))

(assert (=> b!496358 (= lt!224706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224707 (select (arr!15434 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496358 (= lt!224704 (toIndex!0 (select (store (arr!15434 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496358 (= lt!224707 (toIndex!0 (select (arr!15434 a!3235) j!176) mask!3524))))

(declare-fun e!291086 () Bool)

(assert (=> b!496358 e!291086))

(declare-fun res!298746 () Bool)

(assert (=> b!496358 (=> (not res!298746) (not e!291086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32102 (_ BitVec 32)) Bool)

(assert (=> b!496358 (= res!298746 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14748 0))(
  ( (Unit!14749) )
))
(declare-fun lt!224703 () Unit!14748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14748)

(assert (=> b!496358 (= lt!224703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496359 () Bool)

(declare-fun res!298747 () Bool)

(assert (=> b!496359 (=> (not res!298747) (not e!291083))))

(assert (=> b!496359 (= res!298747 (validKeyInArray!0 (select (arr!15434 a!3235) j!176)))))

(declare-fun b!496360 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32102 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!496360 (= e!291086 (= (seekEntryOrOpen!0 (select (arr!15434 a!3235) j!176) a!3235 mask!3524) (Found!3901 j!176)))))

(declare-fun b!496361 () Bool)

(declare-fun res!298741 () Bool)

(assert (=> b!496361 (=> (not res!298741) (not e!291087))))

(declare-datatypes ((List!9592 0))(
  ( (Nil!9589) (Cons!9588 (h!10459 (_ BitVec 64)) (t!15820 List!9592)) )
))
(declare-fun arrayNoDuplicates!0 (array!32102 (_ BitVec 32) List!9592) Bool)

(assert (=> b!496361 (= res!298741 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9589))))

(declare-fun res!298748 () Bool)

(assert (=> start!45214 (=> (not res!298748) (not e!291083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45214 (= res!298748 (validMask!0 mask!3524))))

(assert (=> start!45214 e!291083))

(assert (=> start!45214 true))

(declare-fun array_inv!11230 (array!32102) Bool)

(assert (=> start!45214 (array_inv!11230 a!3235)))

(declare-fun b!496362 () Bool)

(assert (=> b!496362 (= e!291083 e!291087)))

(declare-fun res!298749 () Bool)

(assert (=> b!496362 (=> (not res!298749) (not e!291087))))

(declare-fun lt!224705 () SeekEntryResult!3901)

(assert (=> b!496362 (= res!298749 (or (= lt!224705 (MissingZero!3901 i!1204)) (= lt!224705 (MissingVacant!3901 i!1204))))))

(assert (=> b!496362 (= lt!224705 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496363 () Bool)

(declare-fun res!298742 () Bool)

(assert (=> b!496363 (=> (not res!298742) (not e!291087))))

(assert (=> b!496363 (= res!298742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496364 () Bool)

(declare-fun res!298743 () Bool)

(assert (=> b!496364 (=> (not res!298743) (not e!291083))))

(assert (=> b!496364 (= res!298743 (and (= (size!15798 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15798 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15798 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45214 res!298748) b!496364))

(assert (= (and b!496364 res!298743) b!496359))

(assert (= (and b!496359 res!298747) b!496356))

(assert (= (and b!496356 res!298751) b!496355))

(assert (= (and b!496355 res!298750) b!496362))

(assert (= (and b!496362 res!298749) b!496363))

(assert (= (and b!496363 res!298742) b!496361))

(assert (= (and b!496361 res!298741) b!496358))

(assert (= (and b!496358 res!298746) b!496360))

(assert (= (and b!496358 (not res!298744)) b!496354))

(assert (= (and b!496354 (not res!298745)) b!496357))

(declare-fun m!477577 () Bool)

(assert (=> b!496361 m!477577))

(declare-fun m!477579 () Bool)

(assert (=> b!496359 m!477579))

(assert (=> b!496359 m!477579))

(declare-fun m!477581 () Bool)

(assert (=> b!496359 m!477581))

(declare-fun m!477583 () Bool)

(assert (=> b!496356 m!477583))

(declare-fun m!477585 () Bool)

(assert (=> b!496363 m!477585))

(declare-fun m!477587 () Bool)

(assert (=> b!496357 m!477587))

(assert (=> b!496357 m!477579))

(declare-fun m!477589 () Bool)

(assert (=> b!496355 m!477589))

(declare-fun m!477591 () Bool)

(assert (=> start!45214 m!477591))

(declare-fun m!477593 () Bool)

(assert (=> start!45214 m!477593))

(declare-fun m!477595 () Bool)

(assert (=> b!496358 m!477595))

(declare-fun m!477597 () Bool)

(assert (=> b!496358 m!477597))

(declare-fun m!477599 () Bool)

(assert (=> b!496358 m!477599))

(assert (=> b!496358 m!477579))

(declare-fun m!477601 () Bool)

(assert (=> b!496358 m!477601))

(assert (=> b!496358 m!477599))

(declare-fun m!477603 () Bool)

(assert (=> b!496358 m!477603))

(assert (=> b!496358 m!477579))

(declare-fun m!477605 () Bool)

(assert (=> b!496358 m!477605))

(assert (=> b!496358 m!477579))

(declare-fun m!477607 () Bool)

(assert (=> b!496358 m!477607))

(assert (=> b!496358 m!477599))

(declare-fun m!477609 () Bool)

(assert (=> b!496358 m!477609))

(assert (=> b!496360 m!477579))

(assert (=> b!496360 m!477579))

(declare-fun m!477611 () Bool)

(assert (=> b!496360 m!477611))

(declare-fun m!477613 () Bool)

(assert (=> b!496362 m!477613))

(push 1)

(assert (not b!496363))

(assert (not b!496355))

(assert (not b!496360))

(assert (not b!496358))

(assert (not start!45214))

(assert (not b!496359))

(assert (not b!496361))

(assert (not b!496362))

(assert (not b!496356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

