; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53478 () Bool)

(assert start!53478)

(declare-fun b!582003 () Bool)

(declare-fun res!369822 () Bool)

(declare-fun e!333843 () Bool)

(assert (=> b!582003 (=> (not res!369822) (not e!333843))))

(declare-datatypes ((array!36379 0))(
  ( (array!36380 (arr!17464 (Array (_ BitVec 32) (_ BitVec 64))) (size!17828 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36379)

(declare-datatypes ((List!11505 0))(
  ( (Nil!11502) (Cons!11501 (h!12546 (_ BitVec 64)) (t!17733 List!11505)) )
))
(declare-fun arrayNoDuplicates!0 (array!36379 (_ BitVec 32) List!11505) Bool)

(assert (=> b!582003 (= res!369822 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11502))))

(declare-fun b!582004 () Bool)

(declare-fun res!369827 () Bool)

(declare-fun e!333841 () Bool)

(assert (=> b!582004 (=> (not res!369827) (not e!333841))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582004 (= res!369827 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582005 () Bool)

(assert (=> b!582005 (= e!333843 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5904 0))(
  ( (MissingZero!5904 (index!25843 (_ BitVec 32))) (Found!5904 (index!25844 (_ BitVec 32))) (Intermediate!5904 (undefined!6716 Bool) (index!25845 (_ BitVec 32)) (x!54701 (_ BitVec 32))) (Undefined!5904) (MissingVacant!5904 (index!25846 (_ BitVec 32))) )
))
(declare-fun lt!265018 () SeekEntryResult!5904)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36379 (_ BitVec 32)) SeekEntryResult!5904)

(assert (=> b!582005 (= lt!265018 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17464 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582006 () Bool)

(declare-fun res!369819 () Bool)

(assert (=> b!582006 (=> (not res!369819) (not e!333843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36379 (_ BitVec 32)) Bool)

(assert (=> b!582006 (= res!369819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582008 () Bool)

(assert (=> b!582008 (= e!333841 e!333843)))

(declare-fun res!369825 () Bool)

(assert (=> b!582008 (=> (not res!369825) (not e!333843))))

(declare-fun lt!265017 () SeekEntryResult!5904)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582008 (= res!369825 (or (= lt!265017 (MissingZero!5904 i!1108)) (= lt!265017 (MissingVacant!5904 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36379 (_ BitVec 32)) SeekEntryResult!5904)

(assert (=> b!582008 (= lt!265017 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582009 () Bool)

(declare-fun res!369821 () Bool)

(assert (=> b!582009 (=> (not res!369821) (not e!333843))))

(assert (=> b!582009 (= res!369821 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17464 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17464 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582010 () Bool)

(declare-fun res!369826 () Bool)

(assert (=> b!582010 (=> (not res!369826) (not e!333841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582010 (= res!369826 (validKeyInArray!0 (select (arr!17464 a!2986) j!136)))))

(declare-fun b!582011 () Bool)

(declare-fun res!369823 () Bool)

(assert (=> b!582011 (=> (not res!369823) (not e!333841))))

(assert (=> b!582011 (= res!369823 (and (= (size!17828 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17828 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17828 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582007 () Bool)

(declare-fun res!369820 () Bool)

(assert (=> b!582007 (=> (not res!369820) (not e!333841))))

(assert (=> b!582007 (= res!369820 (validKeyInArray!0 k0!1786))))

(declare-fun res!369824 () Bool)

(assert (=> start!53478 (=> (not res!369824) (not e!333841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53478 (= res!369824 (validMask!0 mask!3053))))

(assert (=> start!53478 e!333841))

(assert (=> start!53478 true))

(declare-fun array_inv!13260 (array!36379) Bool)

(assert (=> start!53478 (array_inv!13260 a!2986)))

(assert (= (and start!53478 res!369824) b!582011))

(assert (= (and b!582011 res!369823) b!582010))

(assert (= (and b!582010 res!369826) b!582007))

(assert (= (and b!582007 res!369820) b!582004))

(assert (= (and b!582004 res!369827) b!582008))

(assert (= (and b!582008 res!369825) b!582006))

(assert (= (and b!582006 res!369819) b!582003))

(assert (= (and b!582003 res!369822) b!582009))

(assert (= (and b!582009 res!369821) b!582005))

(declare-fun m!560523 () Bool)

(assert (=> b!582008 m!560523))

(declare-fun m!560525 () Bool)

(assert (=> b!582009 m!560525))

(declare-fun m!560527 () Bool)

(assert (=> b!582009 m!560527))

(declare-fun m!560529 () Bool)

(assert (=> b!582009 m!560529))

(declare-fun m!560531 () Bool)

(assert (=> start!53478 m!560531))

(declare-fun m!560533 () Bool)

(assert (=> start!53478 m!560533))

(declare-fun m!560535 () Bool)

(assert (=> b!582005 m!560535))

(assert (=> b!582005 m!560535))

(declare-fun m!560537 () Bool)

(assert (=> b!582005 m!560537))

(declare-fun m!560539 () Bool)

(assert (=> b!582004 m!560539))

(declare-fun m!560541 () Bool)

(assert (=> b!582007 m!560541))

(declare-fun m!560543 () Bool)

(assert (=> b!582003 m!560543))

(assert (=> b!582010 m!560535))

(assert (=> b!582010 m!560535))

(declare-fun m!560545 () Bool)

(assert (=> b!582010 m!560545))

(declare-fun m!560547 () Bool)

(assert (=> b!582006 m!560547))

(check-sat (not b!582008) (not b!582003) (not b!582010) (not b!582007) (not b!582004) (not b!582005) (not start!53478) (not b!582006))
(check-sat)
