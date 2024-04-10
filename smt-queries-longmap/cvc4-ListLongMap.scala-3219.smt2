; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45064 () Bool)

(assert start!45064)

(declare-fun b!494606 () Bool)

(declare-fun res!297185 () Bool)

(declare-fun e!290251 () Bool)

(assert (=> b!494606 (=> (not res!297185) (not e!290251))))

(declare-datatypes ((array!32009 0))(
  ( (array!32010 (arr!15389 (Array (_ BitVec 32) (_ BitVec 64))) (size!15753 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32009)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494606 (= res!297185 (validKeyInArray!0 (select (arr!15389 a!3235) j!176)))))

(declare-fun b!494607 () Bool)

(declare-fun res!297182 () Bool)

(declare-fun e!290252 () Bool)

(assert (=> b!494607 (=> res!297182 e!290252)))

(declare-datatypes ((SeekEntryResult!3856 0))(
  ( (MissingZero!3856 (index!17603 (_ BitVec 32))) (Found!3856 (index!17604 (_ BitVec 32))) (Intermediate!3856 (undefined!4668 Bool) (index!17605 (_ BitVec 32)) (x!46670 (_ BitVec 32))) (Undefined!3856) (MissingVacant!3856 (index!17606 (_ BitVec 32))) )
))
(declare-fun lt!223874 () SeekEntryResult!3856)

(assert (=> b!494607 (= res!297182 (or (not (is-Intermediate!3856 lt!223874)) (not (undefined!4668 lt!223874))))))

(declare-fun b!494608 () Bool)

(declare-fun res!297178 () Bool)

(assert (=> b!494608 (=> (not res!297178) (not e!290251))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494608 (= res!297178 (and (= (size!15753 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15753 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15753 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297183 () Bool)

(assert (=> start!45064 (=> (not res!297183) (not e!290251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45064 (= res!297183 (validMask!0 mask!3524))))

(assert (=> start!45064 e!290251))

(assert (=> start!45064 true))

(declare-fun array_inv!11185 (array!32009) Bool)

(assert (=> start!45064 (array_inv!11185 a!3235)))

(declare-fun b!494609 () Bool)

(declare-fun res!297180 () Bool)

(assert (=> b!494609 (=> (not res!297180) (not e!290251))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!494609 (= res!297180 (validKeyInArray!0 k!2280))))

(declare-fun b!494610 () Bool)

(declare-fun res!297184 () Bool)

(declare-fun e!290250 () Bool)

(assert (=> b!494610 (=> (not res!297184) (not e!290250))))

(declare-datatypes ((List!9547 0))(
  ( (Nil!9544) (Cons!9543 (h!10411 (_ BitVec 64)) (t!15775 List!9547)) )
))
(declare-fun arrayNoDuplicates!0 (array!32009 (_ BitVec 32) List!9547) Bool)

(assert (=> b!494610 (= res!297184 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9544))))

(declare-fun b!494611 () Bool)

(declare-fun res!297181 () Bool)

(assert (=> b!494611 (=> (not res!297181) (not e!290250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32009 (_ BitVec 32)) Bool)

(assert (=> b!494611 (= res!297181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494612 () Bool)

(assert (=> b!494612 (= e!290251 e!290250)))

(declare-fun res!297179 () Bool)

(assert (=> b!494612 (=> (not res!297179) (not e!290250))))

(declare-fun lt!223871 () SeekEntryResult!3856)

(assert (=> b!494612 (= res!297179 (or (= lt!223871 (MissingZero!3856 i!1204)) (= lt!223871 (MissingVacant!3856 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32009 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!494612 (= lt!223871 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494613 () Bool)

(declare-fun res!297176 () Bool)

(assert (=> b!494613 (=> (not res!297176) (not e!290251))))

(declare-fun arrayContainsKey!0 (array!32009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494613 (= res!297176 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494614 () Bool)

(assert (=> b!494614 (= e!290252 true)))

(declare-fun lt!223872 () SeekEntryResult!3856)

(assert (=> b!494614 (= lt!223872 Undefined!3856)))

(declare-fun b!494615 () Bool)

(assert (=> b!494615 (= e!290250 (not e!290252))))

(declare-fun res!297177 () Bool)

(assert (=> b!494615 (=> res!297177 e!290252)))

(declare-fun lt!223873 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32009 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!494615 (= res!297177 (= lt!223874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223873 (select (store (arr!15389 a!3235) i!1204 k!2280) j!176) (array!32010 (store (arr!15389 a!3235) i!1204 k!2280) (size!15753 a!3235)) mask!3524)))))

(declare-fun lt!223876 () (_ BitVec 32))

(assert (=> b!494615 (= lt!223874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223876 (select (arr!15389 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494615 (= lt!223873 (toIndex!0 (select (store (arr!15389 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494615 (= lt!223876 (toIndex!0 (select (arr!15389 a!3235) j!176) mask!3524))))

(assert (=> b!494615 (= lt!223872 (Found!3856 j!176))))

(assert (=> b!494615 (= lt!223872 (seekEntryOrOpen!0 (select (arr!15389 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494615 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14658 0))(
  ( (Unit!14659) )
))
(declare-fun lt!223875 () Unit!14658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14658)

(assert (=> b!494615 (= lt!223875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45064 res!297183) b!494608))

(assert (= (and b!494608 res!297178) b!494606))

(assert (= (and b!494606 res!297185) b!494609))

(assert (= (and b!494609 res!297180) b!494613))

(assert (= (and b!494613 res!297176) b!494612))

(assert (= (and b!494612 res!297179) b!494611))

(assert (= (and b!494611 res!297181) b!494610))

(assert (= (and b!494610 res!297184) b!494615))

(assert (= (and b!494615 (not res!297177)) b!494607))

(assert (= (and b!494607 (not res!297182)) b!494614))

(declare-fun m!475683 () Bool)

(assert (=> start!45064 m!475683))

(declare-fun m!475685 () Bool)

(assert (=> start!45064 m!475685))

(declare-fun m!475687 () Bool)

(assert (=> b!494612 m!475687))

(declare-fun m!475689 () Bool)

(assert (=> b!494611 m!475689))

(declare-fun m!475691 () Bool)

(assert (=> b!494609 m!475691))

(declare-fun m!475693 () Bool)

(assert (=> b!494606 m!475693))

(assert (=> b!494606 m!475693))

(declare-fun m!475695 () Bool)

(assert (=> b!494606 m!475695))

(declare-fun m!475697 () Bool)

(assert (=> b!494613 m!475697))

(declare-fun m!475699 () Bool)

(assert (=> b!494610 m!475699))

(declare-fun m!475701 () Bool)

(assert (=> b!494615 m!475701))

(declare-fun m!475703 () Bool)

(assert (=> b!494615 m!475703))

(declare-fun m!475705 () Bool)

(assert (=> b!494615 m!475705))

(declare-fun m!475707 () Bool)

(assert (=> b!494615 m!475707))

(assert (=> b!494615 m!475693))

(declare-fun m!475709 () Bool)

(assert (=> b!494615 m!475709))

(assert (=> b!494615 m!475693))

(declare-fun m!475711 () Bool)

(assert (=> b!494615 m!475711))

(assert (=> b!494615 m!475693))

(declare-fun m!475713 () Bool)

(assert (=> b!494615 m!475713))

(assert (=> b!494615 m!475705))

(declare-fun m!475715 () Bool)

(assert (=> b!494615 m!475715))

(assert (=> b!494615 m!475693))

(declare-fun m!475717 () Bool)

(assert (=> b!494615 m!475717))

(assert (=> b!494615 m!475705))

(push 1)

