; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45846 () Bool)

(assert start!45846)

(declare-fun b!507742 () Bool)

(declare-fun res!308709 () Bool)

(declare-fun e!297132 () Bool)

(assert (=> b!507742 (=> (not res!308709) (not e!297132))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507742 (= res!308709 (validKeyInArray!0 k!2280))))

(declare-fun b!507743 () Bool)

(declare-fun res!308701 () Bool)

(declare-fun e!297130 () Bool)

(assert (=> b!507743 (=> (not res!308701) (not e!297130))))

(declare-datatypes ((array!32602 0))(
  ( (array!32603 (arr!15681 (Array (_ BitVec 32) (_ BitVec 64))) (size!16045 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32602)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32602 (_ BitVec 32)) Bool)

(assert (=> b!507743 (= res!308701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507744 () Bool)

(declare-fun res!308703 () Bool)

(assert (=> b!507744 (=> (not res!308703) (not e!297132))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507744 (= res!308703 (and (= (size!16045 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16045 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16045 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507745 () Bool)

(declare-fun e!297129 () Bool)

(assert (=> b!507745 (= e!297130 (not e!297129))))

(declare-fun res!308702 () Bool)

(assert (=> b!507745 (=> res!308702 e!297129)))

(declare-fun lt!231972 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4148 0))(
  ( (MissingZero!4148 (index!18780 (_ BitVec 32))) (Found!4148 (index!18781 (_ BitVec 32))) (Intermediate!4148 (undefined!4960 Bool) (index!18782 (_ BitVec 32)) (x!47773 (_ BitVec 32))) (Undefined!4148) (MissingVacant!4148 (index!18783 (_ BitVec 32))) )
))
(declare-fun lt!231978 () SeekEntryResult!4148)

(declare-fun lt!231973 () array!32602)

(declare-fun lt!231977 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32602 (_ BitVec 32)) SeekEntryResult!4148)

(assert (=> b!507745 (= res!308702 (= lt!231978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231972 lt!231977 lt!231973 mask!3524)))))

(declare-fun lt!231975 () (_ BitVec 32))

(assert (=> b!507745 (= lt!231978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231975 (select (arr!15681 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507745 (= lt!231972 (toIndex!0 lt!231977 mask!3524))))

(assert (=> b!507745 (= lt!231977 (select (store (arr!15681 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507745 (= lt!231975 (toIndex!0 (select (arr!15681 a!3235) j!176) mask!3524))))

(assert (=> b!507745 (= lt!231973 (array!32603 (store (arr!15681 a!3235) i!1204 k!2280) (size!16045 a!3235)))))

(declare-fun e!297127 () Bool)

(assert (=> b!507745 e!297127))

(declare-fun res!308704 () Bool)

(assert (=> b!507745 (=> (not res!308704) (not e!297127))))

(assert (=> b!507745 (= res!308704 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15584 0))(
  ( (Unit!15585) )
))
(declare-fun lt!231976 () Unit!15584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15584)

(assert (=> b!507745 (= lt!231976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507747 () Bool)

(declare-fun res!308708 () Bool)

(assert (=> b!507747 (=> (not res!308708) (not e!297132))))

(assert (=> b!507747 (= res!308708 (validKeyInArray!0 (select (arr!15681 a!3235) j!176)))))

(declare-fun b!507748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32602 (_ BitVec 32)) SeekEntryResult!4148)

(assert (=> b!507748 (= e!297127 (= (seekEntryOrOpen!0 (select (arr!15681 a!3235) j!176) a!3235 mask!3524) (Found!4148 j!176)))))

(declare-fun b!507749 () Bool)

(declare-fun res!308711 () Bool)

(assert (=> b!507749 (=> (not res!308711) (not e!297132))))

(declare-fun arrayContainsKey!0 (array!32602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507749 (= res!308711 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507750 () Bool)

(assert (=> b!507750 (= e!297132 e!297130)))

(declare-fun res!308707 () Bool)

(assert (=> b!507750 (=> (not res!308707) (not e!297130))))

(declare-fun lt!231979 () SeekEntryResult!4148)

(assert (=> b!507750 (= res!308707 (or (= lt!231979 (MissingZero!4148 i!1204)) (= lt!231979 (MissingVacant!4148 i!1204))))))

(assert (=> b!507750 (= lt!231979 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507751 () Bool)

(declare-fun res!308706 () Bool)

(assert (=> b!507751 (=> (not res!308706) (not e!297130))))

(declare-datatypes ((List!9839 0))(
  ( (Nil!9836) (Cons!9835 (h!10712 (_ BitVec 64)) (t!16067 List!9839)) )
))
(declare-fun arrayNoDuplicates!0 (array!32602 (_ BitVec 32) List!9839) Bool)

(assert (=> b!507751 (= res!308706 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9836))))

(declare-fun b!507752 () Bool)

(declare-fun e!297128 () Bool)

(assert (=> b!507752 (= e!297128 true)))

(declare-fun lt!231971 () SeekEntryResult!4148)

(assert (=> b!507752 (= lt!231971 (seekEntryOrOpen!0 lt!231977 lt!231973 mask!3524))))

(assert (=> b!507752 false))

(declare-fun res!308710 () Bool)

(assert (=> start!45846 (=> (not res!308710) (not e!297132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45846 (= res!308710 (validMask!0 mask!3524))))

(assert (=> start!45846 e!297132))

(assert (=> start!45846 true))

(declare-fun array_inv!11477 (array!32602) Bool)

(assert (=> start!45846 (array_inv!11477 a!3235)))

(declare-fun b!507746 () Bool)

(assert (=> b!507746 (= e!297129 e!297128)))

(declare-fun res!308705 () Bool)

(assert (=> b!507746 (=> res!308705 e!297128)))

(declare-fun lt!231974 () Bool)

(assert (=> b!507746 (= res!308705 (or (and (not lt!231974) (undefined!4960 lt!231978)) (and (not lt!231974) (not (undefined!4960 lt!231978)))))))

(assert (=> b!507746 (= lt!231974 (not (is-Intermediate!4148 lt!231978)))))

(assert (= (and start!45846 res!308710) b!507744))

(assert (= (and b!507744 res!308703) b!507747))

(assert (= (and b!507747 res!308708) b!507742))

(assert (= (and b!507742 res!308709) b!507749))

(assert (= (and b!507749 res!308711) b!507750))

(assert (= (and b!507750 res!308707) b!507743))

(assert (= (and b!507743 res!308701) b!507751))

(assert (= (and b!507751 res!308706) b!507745))

(assert (= (and b!507745 res!308704) b!507748))

(assert (= (and b!507745 (not res!308702)) b!507746))

(assert (= (and b!507746 (not res!308705)) b!507752))

(declare-fun m!488559 () Bool)

(assert (=> b!507750 m!488559))

(declare-fun m!488561 () Bool)

(assert (=> b!507749 m!488561))

(declare-fun m!488563 () Bool)

(assert (=> b!507752 m!488563))

(declare-fun m!488565 () Bool)

(assert (=> b!507745 m!488565))

(declare-fun m!488567 () Bool)

(assert (=> b!507745 m!488567))

(declare-fun m!488569 () Bool)

(assert (=> b!507745 m!488569))

(declare-fun m!488571 () Bool)

(assert (=> b!507745 m!488571))

(assert (=> b!507745 m!488569))

(declare-fun m!488573 () Bool)

(assert (=> b!507745 m!488573))

(assert (=> b!507745 m!488569))

(declare-fun m!488575 () Bool)

(assert (=> b!507745 m!488575))

(declare-fun m!488577 () Bool)

(assert (=> b!507745 m!488577))

(declare-fun m!488579 () Bool)

(assert (=> b!507745 m!488579))

(declare-fun m!488581 () Bool)

(assert (=> b!507745 m!488581))

(declare-fun m!488583 () Bool)

(assert (=> b!507743 m!488583))

(assert (=> b!507747 m!488569))

(assert (=> b!507747 m!488569))

(declare-fun m!488585 () Bool)

(assert (=> b!507747 m!488585))

(declare-fun m!488587 () Bool)

(assert (=> b!507742 m!488587))

(declare-fun m!488589 () Bool)

(assert (=> start!45846 m!488589))

(declare-fun m!488591 () Bool)

(assert (=> start!45846 m!488591))

(declare-fun m!488593 () Bool)

(assert (=> b!507751 m!488593))

(assert (=> b!507748 m!488569))

(assert (=> b!507748 m!488569))

(declare-fun m!488595 () Bool)

(assert (=> b!507748 m!488595))

(push 1)

