; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45172 () Bool)

(assert start!45172)

(declare-fun b!495661 () Bool)

(declare-fun e!290770 () Bool)

(declare-fun e!290769 () Bool)

(assert (=> b!495661 (= e!290770 e!290769)))

(declare-fun res!298053 () Bool)

(assert (=> b!495661 (=> (not res!298053) (not e!290769))))

(declare-datatypes ((SeekEntryResult!3880 0))(
  ( (MissingZero!3880 (index!17699 (_ BitVec 32))) (Found!3880 (index!17700 (_ BitVec 32))) (Intermediate!3880 (undefined!4692 Bool) (index!17701 (_ BitVec 32)) (x!46764 (_ BitVec 32))) (Undefined!3880) (MissingVacant!3880 (index!17702 (_ BitVec 32))) )
))
(declare-fun lt!224388 () SeekEntryResult!3880)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495661 (= res!298053 (or (= lt!224388 (MissingZero!3880 i!1204)) (= lt!224388 (MissingVacant!3880 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32060 0))(
  ( (array!32061 (arr!15413 (Array (_ BitVec 32) (_ BitVec 64))) (size!15777 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32060)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32060 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!495661 (= lt!224388 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495662 () Bool)

(declare-fun e!290768 () Bool)

(assert (=> b!495662 (= e!290768 true)))

(declare-fun lt!224390 () SeekEntryResult!3880)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495662 (and (bvslt (x!46764 lt!224390) #b01111111111111111111111111111110) (or (= (select (arr!15413 a!3235) (index!17701 lt!224390)) (select (arr!15413 a!3235) j!176)) (= (select (arr!15413 a!3235) (index!17701 lt!224390)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15413 a!3235) (index!17701 lt!224390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495663 () Bool)

(declare-fun res!298055 () Bool)

(assert (=> b!495663 (=> (not res!298055) (not e!290769))))

(declare-datatypes ((List!9571 0))(
  ( (Nil!9568) (Cons!9567 (h!10438 (_ BitVec 64)) (t!15799 List!9571)) )
))
(declare-fun arrayNoDuplicates!0 (array!32060 (_ BitVec 32) List!9571) Bool)

(assert (=> b!495663 (= res!298055 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9568))))

(declare-fun b!495664 () Bool)

(declare-fun res!298048 () Bool)

(assert (=> b!495664 (=> (not res!298048) (not e!290770))))

(assert (=> b!495664 (= res!298048 (and (= (size!15777 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15777 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15777 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495665 () Bool)

(declare-fun res!298051 () Bool)

(assert (=> b!495665 (=> (not res!298051) (not e!290770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495665 (= res!298051 (validKeyInArray!0 (select (arr!15413 a!3235) j!176)))))

(declare-fun e!290771 () Bool)

(declare-fun b!495666 () Bool)

(assert (=> b!495666 (= e!290771 (= (seekEntryOrOpen!0 (select (arr!15413 a!3235) j!176) a!3235 mask!3524) (Found!3880 j!176)))))

(declare-fun b!495667 () Bool)

(declare-fun res!298058 () Bool)

(assert (=> b!495667 (=> (not res!298058) (not e!290770))))

(assert (=> b!495667 (= res!298058 (validKeyInArray!0 k!2280))))

(declare-fun b!495668 () Bool)

(declare-fun res!298049 () Bool)

(assert (=> b!495668 (=> (not res!298049) (not e!290770))))

(declare-fun arrayContainsKey!0 (array!32060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495668 (= res!298049 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!298054 () Bool)

(assert (=> start!45172 (=> (not res!298054) (not e!290770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45172 (= res!298054 (validMask!0 mask!3524))))

(assert (=> start!45172 e!290770))

(assert (=> start!45172 true))

(declare-fun array_inv!11209 (array!32060) Bool)

(assert (=> start!45172 (array_inv!11209 a!3235)))

(declare-fun b!495669 () Bool)

(assert (=> b!495669 (= e!290769 (not e!290768))))

(declare-fun res!298056 () Bool)

(assert (=> b!495669 (=> res!298056 e!290768)))

(declare-fun lt!224392 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32060 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!495669 (= res!298056 (= lt!224390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224392 (select (store (arr!15413 a!3235) i!1204 k!2280) j!176) (array!32061 (store (arr!15413 a!3235) i!1204 k!2280) (size!15777 a!3235)) mask!3524)))))

(declare-fun lt!224389 () (_ BitVec 32))

(assert (=> b!495669 (= lt!224390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224389 (select (arr!15413 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495669 (= lt!224392 (toIndex!0 (select (store (arr!15413 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495669 (= lt!224389 (toIndex!0 (select (arr!15413 a!3235) j!176) mask!3524))))

(assert (=> b!495669 e!290771))

(declare-fun res!298050 () Bool)

(assert (=> b!495669 (=> (not res!298050) (not e!290771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32060 (_ BitVec 32)) Bool)

(assert (=> b!495669 (= res!298050 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14706 0))(
  ( (Unit!14707) )
))
(declare-fun lt!224391 () Unit!14706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14706)

(assert (=> b!495669 (= lt!224391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495670 () Bool)

(declare-fun res!298052 () Bool)

(assert (=> b!495670 (=> res!298052 e!290768)))

(assert (=> b!495670 (= res!298052 (or (undefined!4692 lt!224390) (not (is-Intermediate!3880 lt!224390))))))

(declare-fun b!495671 () Bool)

(declare-fun res!298057 () Bool)

(assert (=> b!495671 (=> (not res!298057) (not e!290769))))

(assert (=> b!495671 (= res!298057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45172 res!298054) b!495664))

(assert (= (and b!495664 res!298048) b!495665))

(assert (= (and b!495665 res!298051) b!495667))

(assert (= (and b!495667 res!298058) b!495668))

(assert (= (and b!495668 res!298049) b!495661))

(assert (= (and b!495661 res!298053) b!495671))

(assert (= (and b!495671 res!298057) b!495663))

(assert (= (and b!495663 res!298055) b!495669))

(assert (= (and b!495669 res!298050) b!495666))

(assert (= (and b!495669 (not res!298056)) b!495670))

(assert (= (and b!495670 (not res!298052)) b!495662))

(declare-fun m!476779 () Bool)

(assert (=> b!495667 m!476779))

(declare-fun m!476781 () Bool)

(assert (=> b!495669 m!476781))

(declare-fun m!476783 () Bool)

(assert (=> b!495669 m!476783))

(declare-fun m!476785 () Bool)

(assert (=> b!495669 m!476785))

(declare-fun m!476787 () Bool)

(assert (=> b!495669 m!476787))

(assert (=> b!495669 m!476781))

(declare-fun m!476789 () Bool)

(assert (=> b!495669 m!476789))

(assert (=> b!495669 m!476781))

(declare-fun m!476791 () Bool)

(assert (=> b!495669 m!476791))

(declare-fun m!476793 () Bool)

(assert (=> b!495669 m!476793))

(declare-fun m!476795 () Bool)

(assert (=> b!495669 m!476795))

(assert (=> b!495669 m!476793))

(declare-fun m!476797 () Bool)

(assert (=> b!495669 m!476797))

(assert (=> b!495669 m!476793))

(declare-fun m!476799 () Bool)

(assert (=> start!45172 m!476799))

(declare-fun m!476801 () Bool)

(assert (=> start!45172 m!476801))

(assert (=> b!495665 m!476781))

(assert (=> b!495665 m!476781))

(declare-fun m!476803 () Bool)

(assert (=> b!495665 m!476803))

(declare-fun m!476805 () Bool)

(assert (=> b!495662 m!476805))

(assert (=> b!495662 m!476781))

(declare-fun m!476807 () Bool)

(assert (=> b!495668 m!476807))

(assert (=> b!495666 m!476781))

(assert (=> b!495666 m!476781))

(declare-fun m!476809 () Bool)

(assert (=> b!495666 m!476809))

(declare-fun m!476811 () Bool)

(assert (=> b!495661 m!476811))

(declare-fun m!476813 () Bool)

(assert (=> b!495671 m!476813))

(declare-fun m!476815 () Bool)

(assert (=> b!495663 m!476815))

(push 1)

