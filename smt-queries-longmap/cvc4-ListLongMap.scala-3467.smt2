; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48136 () Bool)

(assert start!48136)

(declare-fun b!530204 () Bool)

(declare-fun res!325911 () Bool)

(declare-fun e!308932 () Bool)

(assert (=> b!530204 (=> (not res!325911) (not e!308932))))

(declare-datatypes ((array!33572 0))(
  ( (array!33573 (arr!16133 (Array (_ BitVec 32) (_ BitVec 64))) (size!16497 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33572)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33572 (_ BitVec 32)) Bool)

(assert (=> b!530204 (= res!325911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!308935 () Bool)

(declare-fun b!530205 () Bool)

(declare-datatypes ((SeekEntryResult!4600 0))(
  ( (MissingZero!4600 (index!20624 (_ BitVec 32))) (Found!4600 (index!20625 (_ BitVec 32))) (Intermediate!4600 (undefined!5412 Bool) (index!20626 (_ BitVec 32)) (x!49590 (_ BitVec 32))) (Undefined!4600) (MissingVacant!4600 (index!20627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33572 (_ BitVec 32)) SeekEntryResult!4600)

(assert (=> b!530205 (= e!308935 (= (seekEntryOrOpen!0 (select (arr!16133 a!3235) j!176) a!3235 mask!3524) (Found!4600 j!176)))))

(declare-fun b!530206 () Bool)

(declare-fun e!308933 () Bool)

(assert (=> b!530206 (= e!308933 true)))

(declare-fun lt!244589 () (_ BitVec 64))

(declare-fun lt!244592 () SeekEntryResult!4600)

(declare-fun lt!244593 () array!33572)

(assert (=> b!530206 (= lt!244592 (seekEntryOrOpen!0 lt!244589 lt!244593 mask!3524))))

(assert (=> b!530206 false))

(declare-fun b!530207 () Bool)

(declare-fun e!308937 () Bool)

(assert (=> b!530207 (= e!308932 (not e!308937))))

(declare-fun res!325909 () Bool)

(assert (=> b!530207 (=> res!325909 e!308937)))

(declare-fun lt!244590 () (_ BitVec 32))

(declare-fun lt!244594 () SeekEntryResult!4600)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33572 (_ BitVec 32)) SeekEntryResult!4600)

(assert (=> b!530207 (= res!325909 (= lt!244594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244590 lt!244589 lt!244593 mask!3524)))))

(declare-fun lt!244586 () (_ BitVec 32))

(assert (=> b!530207 (= lt!244594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244586 (select (arr!16133 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530207 (= lt!244590 (toIndex!0 lt!244589 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530207 (= lt!244589 (select (store (arr!16133 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530207 (= lt!244586 (toIndex!0 (select (arr!16133 a!3235) j!176) mask!3524))))

(assert (=> b!530207 (= lt!244593 (array!33573 (store (arr!16133 a!3235) i!1204 k!2280) (size!16497 a!3235)))))

(assert (=> b!530207 e!308935))

(declare-fun res!325914 () Bool)

(assert (=> b!530207 (=> (not res!325914) (not e!308935))))

(assert (=> b!530207 (= res!325914 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16812 0))(
  ( (Unit!16813) )
))
(declare-fun lt!244587 () Unit!16812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16812)

(assert (=> b!530207 (= lt!244587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530208 () Bool)

(declare-fun e!308934 () Bool)

(assert (=> b!530208 (= e!308934 e!308932)))

(declare-fun res!325912 () Bool)

(assert (=> b!530208 (=> (not res!325912) (not e!308932))))

(declare-fun lt!244588 () SeekEntryResult!4600)

(assert (=> b!530208 (= res!325912 (or (= lt!244588 (MissingZero!4600 i!1204)) (= lt!244588 (MissingVacant!4600 i!1204))))))

(assert (=> b!530208 (= lt!244588 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530203 () Bool)

(declare-fun res!325915 () Bool)

(assert (=> b!530203 (=> (not res!325915) (not e!308934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530203 (= res!325915 (validKeyInArray!0 k!2280))))

(declare-fun res!325917 () Bool)

(assert (=> start!48136 (=> (not res!325917) (not e!308934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48136 (= res!325917 (validMask!0 mask!3524))))

(assert (=> start!48136 e!308934))

(assert (=> start!48136 true))

(declare-fun array_inv!11929 (array!33572) Bool)

(assert (=> start!48136 (array_inv!11929 a!3235)))

(declare-fun b!530209 () Bool)

(declare-fun res!325916 () Bool)

(assert (=> b!530209 (=> (not res!325916) (not e!308934))))

(declare-fun arrayContainsKey!0 (array!33572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530209 (= res!325916 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530210 () Bool)

(declare-fun res!325918 () Bool)

(assert (=> b!530210 (=> (not res!325918) (not e!308934))))

(assert (=> b!530210 (= res!325918 (and (= (size!16497 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16497 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16497 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530211 () Bool)

(assert (=> b!530211 (= e!308937 e!308933)))

(declare-fun res!325910 () Bool)

(assert (=> b!530211 (=> res!325910 e!308933)))

(declare-fun lt!244591 () Bool)

(assert (=> b!530211 (= res!325910 (or (and (not lt!244591) (undefined!5412 lt!244594)) (and (not lt!244591) (not (undefined!5412 lt!244594)))))))

(assert (=> b!530211 (= lt!244591 (not (is-Intermediate!4600 lt!244594)))))

(declare-fun b!530212 () Bool)

(declare-fun res!325919 () Bool)

(assert (=> b!530212 (=> (not res!325919) (not e!308932))))

(declare-datatypes ((List!10291 0))(
  ( (Nil!10288) (Cons!10287 (h!11227 (_ BitVec 64)) (t!16519 List!10291)) )
))
(declare-fun arrayNoDuplicates!0 (array!33572 (_ BitVec 32) List!10291) Bool)

(assert (=> b!530212 (= res!325919 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10288))))

(declare-fun b!530213 () Bool)

(declare-fun res!325913 () Bool)

(assert (=> b!530213 (=> (not res!325913) (not e!308934))))

(assert (=> b!530213 (= res!325913 (validKeyInArray!0 (select (arr!16133 a!3235) j!176)))))

(assert (= (and start!48136 res!325917) b!530210))

(assert (= (and b!530210 res!325918) b!530213))

(assert (= (and b!530213 res!325913) b!530203))

(assert (= (and b!530203 res!325915) b!530209))

(assert (= (and b!530209 res!325916) b!530208))

(assert (= (and b!530208 res!325912) b!530204))

(assert (= (and b!530204 res!325911) b!530212))

(assert (= (and b!530212 res!325919) b!530207))

(assert (= (and b!530207 res!325914) b!530205))

(assert (= (and b!530207 (not res!325909)) b!530211))

(assert (= (and b!530211 (not res!325910)) b!530206))

(declare-fun m!510751 () Bool)

(assert (=> b!530209 m!510751))

(declare-fun m!510753 () Bool)

(assert (=> start!48136 m!510753))

(declare-fun m!510755 () Bool)

(assert (=> start!48136 m!510755))

(declare-fun m!510757 () Bool)

(assert (=> b!530205 m!510757))

(assert (=> b!530205 m!510757))

(declare-fun m!510759 () Bool)

(assert (=> b!530205 m!510759))

(declare-fun m!510761 () Bool)

(assert (=> b!530203 m!510761))

(declare-fun m!510763 () Bool)

(assert (=> b!530204 m!510763))

(assert (=> b!530213 m!510757))

(assert (=> b!530213 m!510757))

(declare-fun m!510765 () Bool)

(assert (=> b!530213 m!510765))

(declare-fun m!510767 () Bool)

(assert (=> b!530212 m!510767))

(declare-fun m!510769 () Bool)

(assert (=> b!530208 m!510769))

(declare-fun m!510771 () Bool)

(assert (=> b!530206 m!510771))

(declare-fun m!510773 () Bool)

(assert (=> b!530207 m!510773))

(declare-fun m!510775 () Bool)

(assert (=> b!530207 m!510775))

(declare-fun m!510777 () Bool)

(assert (=> b!530207 m!510777))

(declare-fun m!510779 () Bool)

(assert (=> b!530207 m!510779))

(assert (=> b!530207 m!510757))

(declare-fun m!510781 () Bool)

(assert (=> b!530207 m!510781))

(assert (=> b!530207 m!510757))

(declare-fun m!510783 () Bool)

(assert (=> b!530207 m!510783))

(declare-fun m!510785 () Bool)

(assert (=> b!530207 m!510785))

(assert (=> b!530207 m!510757))

(declare-fun m!510787 () Bool)

(assert (=> b!530207 m!510787))

(push 1)

