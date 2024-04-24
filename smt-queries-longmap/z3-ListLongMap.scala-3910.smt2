; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53520 () Bool)

(assert start!53520)

(declare-fun res!369813 () Bool)

(declare-fun e!333934 () Bool)

(assert (=> start!53520 (=> (not res!369813) (not e!333934))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53520 (= res!369813 (validMask!0 mask!3053))))

(assert (=> start!53520 e!333934))

(assert (=> start!53520 true))

(declare-datatypes ((array!36366 0))(
  ( (array!36367 (arr!17455 (Array (_ BitVec 32) (_ BitVec 64))) (size!17819 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36366)

(declare-fun array_inv!13314 (array!36366) Bool)

(assert (=> start!53520 (array_inv!13314 a!2986)))

(declare-fun b!582095 () Bool)

(declare-fun res!369814 () Bool)

(assert (=> b!582095 (=> (not res!369814) (not e!333934))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582095 (= res!369814 (validKeyInArray!0 k0!1786))))

(declare-fun b!582096 () Bool)

(declare-fun res!369809 () Bool)

(assert (=> b!582096 (=> (not res!369809) (not e!333934))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582096 (= res!369809 (and (= (size!17819 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17819 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17819 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582097 () Bool)

(declare-fun res!369811 () Bool)

(declare-fun e!333936 () Bool)

(assert (=> b!582097 (=> (not res!369811) (not e!333936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36366 (_ BitVec 32)) Bool)

(assert (=> b!582097 (= res!369811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582098 () Bool)

(declare-fun res!369806 () Bool)

(assert (=> b!582098 (=> (not res!369806) (not e!333934))))

(declare-fun arrayContainsKey!0 (array!36366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582098 (= res!369806 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582099 () Bool)

(declare-fun res!369807 () Bool)

(assert (=> b!582099 (=> (not res!369807) (not e!333936))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582099 (= res!369807 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17455 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17455 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582100 () Bool)

(declare-fun res!369808 () Bool)

(assert (=> b!582100 (=> (not res!369808) (not e!333934))))

(assert (=> b!582100 (= res!369808 (validKeyInArray!0 (select (arr!17455 a!2986) j!136)))))

(declare-fun b!582101 () Bool)

(assert (=> b!582101 (= e!333934 e!333936)))

(declare-fun res!369810 () Bool)

(assert (=> b!582101 (=> (not res!369810) (not e!333936))))

(declare-datatypes ((SeekEntryResult!5851 0))(
  ( (MissingZero!5851 (index!25631 (_ BitVec 32))) (Found!5851 (index!25632 (_ BitVec 32))) (Intermediate!5851 (undefined!6663 Bool) (index!25633 (_ BitVec 32)) (x!54643 (_ BitVec 32))) (Undefined!5851) (MissingVacant!5851 (index!25634 (_ BitVec 32))) )
))
(declare-fun lt!265105 () SeekEntryResult!5851)

(assert (=> b!582101 (= res!369810 (or (= lt!265105 (MissingZero!5851 i!1108)) (= lt!265105 (MissingVacant!5851 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36366 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!582101 (= lt!265105 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582102 () Bool)

(assert (=> b!582102 (= e!333936 false)))

(declare-fun lt!265104 () SeekEntryResult!5851)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36366 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!582102 (= lt!265104 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17455 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582103 () Bool)

(declare-fun res!369812 () Bool)

(assert (=> b!582103 (=> (not res!369812) (not e!333936))))

(declare-datatypes ((List!11403 0))(
  ( (Nil!11400) (Cons!11399 (h!12447 (_ BitVec 64)) (t!17623 List!11403)) )
))
(declare-fun arrayNoDuplicates!0 (array!36366 (_ BitVec 32) List!11403) Bool)

(assert (=> b!582103 (= res!369812 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11400))))

(assert (= (and start!53520 res!369813) b!582096))

(assert (= (and b!582096 res!369809) b!582100))

(assert (= (and b!582100 res!369808) b!582095))

(assert (= (and b!582095 res!369814) b!582098))

(assert (= (and b!582098 res!369806) b!582101))

(assert (= (and b!582101 res!369810) b!582097))

(assert (= (and b!582097 res!369811) b!582103))

(assert (= (and b!582103 res!369812) b!582099))

(assert (= (and b!582099 res!369807) b!582102))

(declare-fun m!560771 () Bool)

(assert (=> b!582097 m!560771))

(declare-fun m!560773 () Bool)

(assert (=> b!582100 m!560773))

(assert (=> b!582100 m!560773))

(declare-fun m!560775 () Bool)

(assert (=> b!582100 m!560775))

(declare-fun m!560777 () Bool)

(assert (=> b!582103 m!560777))

(declare-fun m!560779 () Bool)

(assert (=> b!582099 m!560779))

(declare-fun m!560781 () Bool)

(assert (=> b!582099 m!560781))

(declare-fun m!560783 () Bool)

(assert (=> b!582099 m!560783))

(declare-fun m!560785 () Bool)

(assert (=> b!582101 m!560785))

(assert (=> b!582102 m!560773))

(assert (=> b!582102 m!560773))

(declare-fun m!560787 () Bool)

(assert (=> b!582102 m!560787))

(declare-fun m!560789 () Bool)

(assert (=> b!582095 m!560789))

(declare-fun m!560791 () Bool)

(assert (=> b!582098 m!560791))

(declare-fun m!560793 () Bool)

(assert (=> start!53520 m!560793))

(declare-fun m!560795 () Bool)

(assert (=> start!53520 m!560795))

(check-sat (not b!582095) (not b!582103) (not b!582101) (not b!582102) (not b!582100) (not b!582097) (not start!53520) (not b!582098))
(check-sat)
