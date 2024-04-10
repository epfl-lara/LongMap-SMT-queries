; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44746 () Bool)

(assert start!44746)

(declare-fun b!491172 () Bool)

(declare-fun res!294115 () Bool)

(declare-fun e!288638 () Bool)

(assert (=> b!491172 (=> (not res!294115) (not e!288638))))

(declare-datatypes ((array!31805 0))(
  ( (array!31806 (arr!15290 (Array (_ BitVec 32) (_ BitVec 64))) (size!15654 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31805)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491172 (= res!294115 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294110 () Bool)

(assert (=> start!44746 (=> (not res!294110) (not e!288638))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44746 (= res!294110 (validMask!0 mask!3524))))

(assert (=> start!44746 e!288638))

(assert (=> start!44746 true))

(declare-fun array_inv!11086 (array!31805) Bool)

(assert (=> start!44746 (array_inv!11086 a!3235)))

(declare-fun b!491173 () Bool)

(declare-fun res!294114 () Bool)

(assert (=> b!491173 (=> (not res!294114) (not e!288638))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491173 (= res!294114 (and (= (size!15654 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15654 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15654 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491174 () Bool)

(declare-fun e!288637 () Bool)

(assert (=> b!491174 (= e!288638 e!288637)))

(declare-fun res!294116 () Bool)

(assert (=> b!491174 (=> (not res!294116) (not e!288637))))

(declare-datatypes ((SeekEntryResult!3757 0))(
  ( (MissingZero!3757 (index!17207 (_ BitVec 32))) (Found!3757 (index!17208 (_ BitVec 32))) (Intermediate!3757 (undefined!4569 Bool) (index!17209 (_ BitVec 32)) (x!46295 (_ BitVec 32))) (Undefined!3757) (MissingVacant!3757 (index!17210 (_ BitVec 32))) )
))
(declare-fun lt!221979 () SeekEntryResult!3757)

(assert (=> b!491174 (= res!294116 (or (= lt!221979 (MissingZero!3757 i!1204)) (= lt!221979 (MissingVacant!3757 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31805 (_ BitVec 32)) SeekEntryResult!3757)

(assert (=> b!491174 (= lt!221979 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491175 () Bool)

(declare-fun res!294108 () Bool)

(assert (=> b!491175 (=> (not res!294108) (not e!288638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491175 (= res!294108 (validKeyInArray!0 (select (arr!15290 a!3235) j!176)))))

(declare-fun b!491176 () Bool)

(declare-fun e!288636 () Bool)

(assert (=> b!491176 (= e!288637 (not e!288636))))

(declare-fun res!294113 () Bool)

(assert (=> b!491176 (=> res!294113 e!288636)))

(declare-fun lt!221976 () (_ BitVec 64))

(declare-fun lt!221977 () array!31805)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31805 (_ BitVec 32)) SeekEntryResult!3757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491176 (= res!294113 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15290 a!3235) j!176) mask!3524) (select (arr!15290 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221976 mask!3524) lt!221976 lt!221977 mask!3524))))))

(assert (=> b!491176 (= lt!221976 (select (store (arr!15290 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491176 (= lt!221977 (array!31806 (store (arr!15290 a!3235) i!1204 k!2280) (size!15654 a!3235)))))

(declare-fun lt!221980 () SeekEntryResult!3757)

(assert (=> b!491176 (= lt!221980 (Found!3757 j!176))))

(assert (=> b!491176 (= lt!221980 (seekEntryOrOpen!0 (select (arr!15290 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31805 (_ BitVec 32)) Bool)

(assert (=> b!491176 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14460 0))(
  ( (Unit!14461) )
))
(declare-fun lt!221978 () Unit!14460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14460)

(assert (=> b!491176 (= lt!221978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491177 () Bool)

(declare-fun res!294112 () Bool)

(assert (=> b!491177 (=> (not res!294112) (not e!288637))))

(assert (=> b!491177 (= res!294112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491178 () Bool)

(assert (=> b!491178 (= e!288636 true)))

(assert (=> b!491178 (= lt!221980 (seekEntryOrOpen!0 lt!221976 lt!221977 mask!3524))))

(declare-fun lt!221975 () Unit!14460)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31805 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14460)

(assert (=> b!491178 (= lt!221975 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491179 () Bool)

(declare-fun res!294109 () Bool)

(assert (=> b!491179 (=> (not res!294109) (not e!288638))))

(assert (=> b!491179 (= res!294109 (validKeyInArray!0 k!2280))))

(declare-fun b!491180 () Bool)

(declare-fun res!294111 () Bool)

(assert (=> b!491180 (=> (not res!294111) (not e!288637))))

(declare-datatypes ((List!9448 0))(
  ( (Nil!9445) (Cons!9444 (h!10306 (_ BitVec 64)) (t!15676 List!9448)) )
))
(declare-fun arrayNoDuplicates!0 (array!31805 (_ BitVec 32) List!9448) Bool)

(assert (=> b!491180 (= res!294111 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9445))))

(assert (= (and start!44746 res!294110) b!491173))

(assert (= (and b!491173 res!294114) b!491175))

(assert (= (and b!491175 res!294108) b!491179))

(assert (= (and b!491179 res!294109) b!491172))

(assert (= (and b!491172 res!294115) b!491174))

(assert (= (and b!491174 res!294116) b!491177))

(assert (= (and b!491177 res!294112) b!491180))

(assert (= (and b!491180 res!294111) b!491176))

(assert (= (and b!491176 (not res!294113)) b!491178))

(declare-fun m!471623 () Bool)

(assert (=> b!491175 m!471623))

(assert (=> b!491175 m!471623))

(declare-fun m!471625 () Bool)

(assert (=> b!491175 m!471625))

(declare-fun m!471627 () Bool)

(assert (=> b!491172 m!471627))

(declare-fun m!471629 () Bool)

(assert (=> start!44746 m!471629))

(declare-fun m!471631 () Bool)

(assert (=> start!44746 m!471631))

(declare-fun m!471633 () Bool)

(assert (=> b!491179 m!471633))

(declare-fun m!471635 () Bool)

(assert (=> b!491177 m!471635))

(declare-fun m!471637 () Bool)

(assert (=> b!491176 m!471637))

(declare-fun m!471639 () Bool)

(assert (=> b!491176 m!471639))

(declare-fun m!471641 () Bool)

(assert (=> b!491176 m!471641))

(declare-fun m!471643 () Bool)

(assert (=> b!491176 m!471643))

(declare-fun m!471645 () Bool)

(assert (=> b!491176 m!471645))

(assert (=> b!491176 m!471623))

(declare-fun m!471647 () Bool)

(assert (=> b!491176 m!471647))

(assert (=> b!491176 m!471623))

(assert (=> b!491176 m!471645))

(assert (=> b!491176 m!471623))

(declare-fun m!471649 () Bool)

(assert (=> b!491176 m!471649))

(assert (=> b!491176 m!471623))

(declare-fun m!471651 () Bool)

(assert (=> b!491176 m!471651))

(declare-fun m!471653 () Bool)

(assert (=> b!491176 m!471653))

(assert (=> b!491176 m!471637))

(declare-fun m!471655 () Bool)

(assert (=> b!491180 m!471655))

(declare-fun m!471657 () Bool)

(assert (=> b!491178 m!471657))

(declare-fun m!471659 () Bool)

(assert (=> b!491178 m!471659))

(declare-fun m!471661 () Bool)

(assert (=> b!491174 m!471661))

(push 1)

(assert (not b!491175))

(assert (not b!491172))

