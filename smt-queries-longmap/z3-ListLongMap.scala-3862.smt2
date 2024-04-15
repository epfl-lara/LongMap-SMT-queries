; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53166 () Bool)

(assert start!53166)

(declare-fun b!577822 () Bool)

(declare-fun res!365780 () Bool)

(declare-fun e!332337 () Bool)

(assert (=> b!577822 (=> (not res!365780) (not e!332337))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36081 0))(
  ( (array!36082 (arr!17315 (Array (_ BitVec 32) (_ BitVec 64))) (size!17680 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36081)

(assert (=> b!577822 (= res!365780 (and (= (size!17680 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17680 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17680 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365782 () Bool)

(assert (=> start!53166 (=> (not res!365782) (not e!332337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53166 (= res!365782 (validMask!0 mask!3053))))

(assert (=> start!53166 e!332337))

(assert (=> start!53166 true))

(declare-fun array_inv!13198 (array!36081) Bool)

(assert (=> start!53166 (array_inv!13198 a!2986)))

(declare-fun b!577823 () Bool)

(declare-fun res!365783 () Bool)

(declare-fun e!332335 () Bool)

(assert (=> b!577823 (=> (not res!365783) (not e!332335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36081 (_ BitVec 32)) Bool)

(assert (=> b!577823 (= res!365783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577824 () Bool)

(declare-fun res!365781 () Bool)

(assert (=> b!577824 (=> (not res!365781) (not e!332337))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577824 (= res!365781 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577825 () Bool)

(declare-fun res!365784 () Bool)

(assert (=> b!577825 (=> (not res!365784) (not e!332337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577825 (= res!365784 (validKeyInArray!0 (select (arr!17315 a!2986) j!136)))))

(declare-fun b!577826 () Bool)

(declare-fun res!365785 () Bool)

(assert (=> b!577826 (=> (not res!365785) (not e!332337))))

(assert (=> b!577826 (= res!365785 (validKeyInArray!0 k0!1786))))

(declare-fun b!577827 () Bool)

(assert (=> b!577827 (= e!332337 e!332335)))

(declare-fun res!365786 () Bool)

(assert (=> b!577827 (=> (not res!365786) (not e!332335))))

(declare-datatypes ((SeekEntryResult!5752 0))(
  ( (MissingZero!5752 (index!25235 (_ BitVec 32))) (Found!5752 (index!25236 (_ BitVec 32))) (Intermediate!5752 (undefined!6564 Bool) (index!25237 (_ BitVec 32)) (x!54152 (_ BitVec 32))) (Undefined!5752) (MissingVacant!5752 (index!25238 (_ BitVec 32))) )
))
(declare-fun lt!263940 () SeekEntryResult!5752)

(assert (=> b!577827 (= res!365786 (or (= lt!263940 (MissingZero!5752 i!1108)) (= lt!263940 (MissingVacant!5752 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36081 (_ BitVec 32)) SeekEntryResult!5752)

(assert (=> b!577827 (= lt!263940 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577828 () Bool)

(assert (=> b!577828 (= e!332335 false)))

(declare-fun lt!263941 () Bool)

(declare-datatypes ((List!11395 0))(
  ( (Nil!11392) (Cons!11391 (h!12436 (_ BitVec 64)) (t!17614 List!11395)) )
))
(declare-fun arrayNoDuplicates!0 (array!36081 (_ BitVec 32) List!11395) Bool)

(assert (=> b!577828 (= lt!263941 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11392))))

(assert (= (and start!53166 res!365782) b!577822))

(assert (= (and b!577822 res!365780) b!577825))

(assert (= (and b!577825 res!365784) b!577826))

(assert (= (and b!577826 res!365785) b!577824))

(assert (= (and b!577824 res!365781) b!577827))

(assert (= (and b!577827 res!365786) b!577823))

(assert (= (and b!577823 res!365783) b!577828))

(declare-fun m!556033 () Bool)

(assert (=> b!577824 m!556033))

(declare-fun m!556035 () Bool)

(assert (=> b!577825 m!556035))

(assert (=> b!577825 m!556035))

(declare-fun m!556037 () Bool)

(assert (=> b!577825 m!556037))

(declare-fun m!556039 () Bool)

(assert (=> b!577827 m!556039))

(declare-fun m!556041 () Bool)

(assert (=> b!577823 m!556041))

(declare-fun m!556043 () Bool)

(assert (=> b!577826 m!556043))

(declare-fun m!556045 () Bool)

(assert (=> start!53166 m!556045))

(declare-fun m!556047 () Bool)

(assert (=> start!53166 m!556047))

(declare-fun m!556049 () Bool)

(assert (=> b!577828 m!556049))

(check-sat (not b!577828) (not b!577825) (not b!577824) (not b!577827) (not b!577826) (not start!53166) (not b!577823))
(check-sat)
